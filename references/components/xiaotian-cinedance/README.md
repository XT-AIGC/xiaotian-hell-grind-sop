# xiaotian-CINEDANCE

一个项目内 Codex Skill，将角色表演设计与 Seedance 2.0 导演镜头调度融合到同一条中文视频提示词中。

## 默认行为

- 有人物：先建立目标、压力、策略、倾听和可见节拍，再用空间、机位、镜头、灯光和声音覆盖这些节拍。
- 无人物：跳过表演模块，只执行导演、物理、灯光和连续性控制。
- 默认只输出简体中文成品提示词；英文或双语必须由用户明确要求。

## 目录

```text
xiaotian-cinedance/
├── SKILL.md
├── agents/openai.yaml
├── references/
├── templates/
├── examples/
├── evals/
├── scripts/
├── SOURCE_NOTES.md
└── README.md
```

## 本地验证

在 PowerShell 中运行：

```powershell
& '.\scripts\validate-skill.ps1'
```

当前目录是项目交付包，不代表已经安装到 Codex 全局 Skill 目录。
