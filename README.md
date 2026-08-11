# xiaotian-Hell Grind-sop

一个自包含的AI影视提示词总控，将LIRA视觉资产系统与`xiaotian-CINEDANCE`表演导演系统封装在同一个Skill中。

## 三条路线

- 视觉资产：人物、场景、道具、关键帧和图片编辑，只使用LIRA。
- 视频直达：已有足够参考或不需要前置图片，直接使用`xiaotian-CINEDANCE`。
- 完整制作：LIRA资产设计 → 实际生成与验收 → 上传标签绑定 → 中文Seedance 2.0视频提示词。

图片模型核心提示词默认英文；视频模型核心提示词默认简体中文。总控不会把尚未生成或上传的图片伪装成`@Image`引用。

## 目录

```text
xiaotian-hell-grind-sop/
├── SKILL.md
├── agents/openai.yaml
├── references/
│   ├── routing-and-handoff.md
│   └── components/
├── templates/asset-handoff-template.md
├── examples/full-route-example.md
├── evals/
├── scripts/validate-sop.ps1
├── COMPONENT_MANIFEST.json
└── SOURCE_NOTES.md
```

## 验证

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File '.\scripts\validate-sop.ps1'
```

这是项目内源码包，不代表已经安装到Codex全局Skill目录。

