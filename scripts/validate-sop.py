#!/usr/bin/env python3
"""Static contracts only; does not execute a video model or score eval responses."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

import yaml


def validate(root):
    failures = []
    checks = 0

    def require(condition, message):
        nonlocal checks
        checks += 1
        if not condition:
            failures.append(message)

    def read(relative):
        path = root / relative
        require(path.is_file(), f"Missing file: {relative}")
        return path.read_text(encoding="utf-8") if path.is_file() else ""

    skill = read("SKILL.md")
    parts = skill.split("---", 2)
    front = yaml.safe_load(parts[1]) if len(parts) == 3 else {}
    require(front.get("name") == "xiaotian-hell-grind-sop", "Invalid skill name")
    require(set(front) == {"name", "description"}, "Invalid frontmatter keys")
    require("Use when" in front.get("description", ""), "Missing trigger semantics")
    require("2.0" in front.get("description", "") and "2.5" in front.get("description", ""), "Trigger must cover both versions")
    require(len(skill.splitlines()) <= 500, "SKILL.md exceeds 500 lines")
    for term in ("视觉资产路线", "视频直达路线", "完整制作路线", "图片模型核心提示词使用英文", "简体中文 Seedance", "不替用户编号", "seedance-version-compatibility.md"):
        require(term in skill, f"Missing SKILL contract: {term}")

    metadata = yaml.safe_load(read("agents/openai.yaml"))["interface"]
    require(metadata["display_name"] == "xiaotian-Hell Grind-sop", "Invalid display name")
    require(25 <= len(metadata["short_description"]) <= 64, "Invalid short description length")
    require("$xiaotian-hell-grind-sop" in metadata["default_prompt"], "Invalid invocation name")
    for relative, content in (("README.md", read("README.md")), ("SKILL.md", skill), ("agents/openai.yaml", metadata["default_prompt"]), ("references/routing-and-handoff.md", read("references/routing-and-handoff.md"))):
        require("未指定版本默认" in content and "2.0" in content and "2.5" in content, f"Missing default/version contract: {relative}")
        require(not re.search(r"默认(?:直接输出|使用|采用|选择)?\s*(?:Seedance\s*)?2\.5", content), f"Unexpected 2.5 default: {relative}")

    audit = read("references/seedance-version-compatibility.md")
    for term in ("2026-07-31", "https://seed.bytedance.com/en/blog/one-take-creation-flexible-referencing-introducing-seedance-2-5", "https://seed.bytedance.com/en/seedance2_5", "15→30", "30图/10视频/10音频", "两次", "时间戳", "平台", "不自动升级"):
        require(term in audit, f"Missing audit boundary/source: {term}")
    read("templates/asset-handoff-template.md")
    read("SOURCE_NOTES.md")
    full = read("examples/full-route-example.md")
    require("Seedance 2.0" in full and "Soul 2.0" in full, "Legacy route/image model missing")
    examples = read("examples/seedance-version-examples.md")
    for term in ("【Seedance 2.0 中文视频提示词】", "【Seedance 2.5 中文视频提示词】", "【Seedance 2.5 中文视频编辑提示词】", "【Seedance 2.5 中文续接提示词】", "能力未知", "未指定版本默认 2.0"):
        require(term in examples, f"Missing example: {term}")
    # Check timeline coverage of the authored 30-second generation example.
    segment = examples.split("【Seedance 2.5 中文视频提示词】", 1)[-1].split("```", 1)[0]
    times = [(int(a), int(b)) for a, b in re.findall(r"(\d+)–(\d+)秒：", segment)]
    require(bool(times) and times[0][0] == 0 and times[-1][1] == 30, "30-second example endpoints incorrect")
    require(all(a < b for a, b in times) and all(a[1] == b[0] for a, b in zip(times, times[1:])), "30-second example timeline has gap/overlap")

    manifest = json.loads(read("COMPONENT_MANIFEST.json"))["components"]
    require(len(manifest) == 11, "Expected 11 embedded component files")
    for entry in manifest:
        path = root / entry["path"]
        require(path.is_file(), f"Missing component: {entry['path']}")
        if path.is_file():
            content = path.read_bytes()
            require(len(content) == entry["bytes"], f"Component size changed: {entry['path']}")
            require(hashlib.sha256(content).hexdigest().upper() == entry["sha256"], f"Component hash changed: {entry['path']}")
    require(not (root / "references/components/xiaotian-cinedance/evals").exists(), "Embedded development evals are not allowed")

    evals = json.loads(read("evals/evals.json"))
    require(evals["skill_name"] == front["name"], "Eval skill name mismatch")
    cases = {case["id"]: case for case in evals["evals"]}
    require(len(cases) == len(evals["evals"]), "Duplicate eval IDs")
    require(set(range(1, 14)).issubset(cases), "Missing route/version evals")
    expected_versions = {1: "2.0", 2: "2.0", 3: None, 4: "2.0", 5: "2.0", 6: "2.5", 7: "2.5", 8: "2.5", 9: "2.5", 10: "2.0", 11: "2.5", 12: None, 13: "2.0"}
    for case_id, version in expected_versions.items():
        case = cases.get(case_id, {})
        require(case.get("target_version") == version, f"Eval {case_id}: wrong version")
        require(bool(case.get("prompt")) and bool(case.get("expected_output")), f"Eval {case_id}: incomplete contract")

    legacy_terms = {
        "eval-1-full-route": ("CHAR-01", "LOC-01", "Three studio photographs", "Eye-level three-quarter wide view", "当前不输出最终视频提示词"),
        "eval-2-video-direct": ("@Image1", "@Image2", "第一帧", "角色表演与镜头", "分段动作"),
        "eval-3-image-edit": ("CHANGE:", "PRESERVE EXACTLY:", "ONLY CHANGE:", "Nano Banana Pro"),
        "eval-4-no-fake-tags": ("尚未上传", "真实标签", "不会把内部资产ID"),
    }
    for folder, terms in legacy_terms.items():
        content = read(f"evals/iteration-1/{folder}/output.md")
        for term in terms:
            require(term in content, f"Legacy output {folder}: missing {term}")
        if folder == "eval-1-full-route":
            require(not re.search(r"@Image\d+", content), "Fake tags in asset-stage legacy output")
        if folder == "eval-3-image-edit":
            require(not re.search(r"Seedance 2\.(?:0|5) 成品提示词|【角色表演", content), "Video route leaked into image editing")

    # Resolve local Markdown links outside immutable source components.
    for path in root.rglob("*.md"):
        if ".git" in path.parts or "components" in path.parts:
            continue
        for target in re.findall(r"\]\(([^)]+)\)", path.read_text(encoding="utf-8")):
            if target.startswith(("http:", "https:", "#")):
                continue
            local = target.split("#", 1)[0]
            require((path.parent / local).exists(), f"Broken link: {path.relative_to(root)} -> {target}")
    return checks, failures


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    try:
        checks, failures = validate(args.root)
    except (OSError, ValueError, KeyError, TypeError, yaml.YAMLError) as error:
        print(f"[FAIL] Cannot validate: {error}", file=sys.stderr)
        return 1
    if failures:
        print("[FAIL]\n" + "\n".join(f" - {item}" for item in failures))
        return 1
    print(f"[PASS] {checks} static assertions; 11 component hashes; 13 eval contracts; 4 legacy output fixtures. No model execution.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
