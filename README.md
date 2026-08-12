<div align="center">

# xiaotian-Hell Grind-sop

### 从视觉资产到 Seedance 镜头的 AI 影视一体化总控

把人物、场景、道具和关键帧的设计，与角色表演、空间走位、导演调度和中文 Seedance 2.0 视频提示词连接成一条可靠工作流。

[功能说明](#它解决什么问题) · [三条制作路线](#三条制作路线) · [安装方式](#安装方式) · [下载 ZIP](https://github.com/XT-AIGC/xiaotian-hell-grind-sop/archive/refs/heads/main.zip) · [快速上手](#快速上手)

![Codex Skill](https://img.shields.io/badge/Codex-Skill-111827?style=flat-square)
![Seedance 2.0](https://img.shields.io/badge/Seedance-2.0-7C3AED?style=flat-square)
![Language](https://img.shields.io/badge/输出语言-简体中文-16A34A?style=flat-square)

</div>

> 这不是一个只会“写几句提示词”的 Skill。它负责判断当前应该先做视觉资产，还是直接进入视频镜头；并在完整制作中守住资产验收、真实引用和镜头连续性。

## 它解决什么问题

AI 影视制作最常见的断点，往往不在单张图片或单条视频提示词，而在两者之间：

- 人物图、场景图做了一堆，却不知道哪张真正服务当前镜头。
- 还没生成或上传素材，就提前虚构 `@Image1`、`@Image2` 等引用。
- 图片阶段决定了角色与空间，视频阶段又把它们悄悄改掉。
- 表演、走位、机位、灯光和声音分别写得很满，但没有形成同一个可执行镜头。
- 简单任务也被迫跑完整套流程，浪费时间和生成次数。

`xiaotian-Hell Grind-sop` 用一套总控路由连接两个内嵌组件：

- **LIRA**：负责人物、场景、产品、道具、关键帧与图片编辑提示词。
- **xiaotian-CINEDANCE**：负责人物表演、空间走位、导演调度与中文 Seedance 2.0 视频提示词。

总控只加载当前阶段真正需要的组件，不把尚未存在的素材假装成可用引用。

## 三条制作路线

| 路线 | 什么时候用 | 你会得到什么 |
|---|---|---|
| **视觉资产** | 需要定妆、场景、道具、产品图、关键帧或图片修改 | 英文图片核心提示词、中文参数、资产职责与使用说明 |
| **视频直达** | 已有足够参考素材，或当前镜头不需要先生成图片 | 人物表演、走位、摄影、灯光、声音完整协同的中文 Seedance 2.0 提示词 |
| **完整制作** | 人物、空间或关键道具尚未锁定，需要先做资产再做视频 | 资产设计 → 实际生成与验收 → 引用交接 → 视频提示词的分阶段成果 |

### 完整制作的关键原则

```text
需求判断
   ↓
视觉资产设计（LIRA）
   ↓
实际生成与人工验收
   ↓
绑定平台真实 @Image / @Video 标签
   ↓
镜头编译（xiaotian-CINEDANCE）
   ↓
中文 Seedance 2.0 成品提示词
```

只有真正生成、验收并上传的素材，才会进入视频引用。计划中的素材始终保持“待生成 / 待验收 / 待绑定”。

## 适合谁用

- 用 Seedance 2.0 制作 AI 短片、短剧、广告、概念片或作品集的人。
- 需要同时控制角色身份、空间关系、道具职责和镜头连续性的创作者。
- 已经有图片素材，但不知道哪些应该作为视频参考的人。
- 想减少假引用、重复生图、角色漂移和镜头信息互相打架的人。
- 希望图片提示词偏专业英文、最终视频提示词保持简体中文的人。

## 它不会替你做什么

- 不会把计划中的图片说成已经生成。
- 不会擅自替你编造平台引用标签。
- 不代表图片或视频已经实际生成。
- 不替代剪辑、调色、混音、字幕和最终发布。
- 不会为了“跑完整流程”而给简单任务增加不必要步骤。

## 输入与输出

你可以只给一句需求，也可以带上已经存在的素材状态。

### 输入示例

```text
我想做一个雨夜便利店短片。女主刚发现男友在骗她，手里捏着一张车票。
我还没有人物图和场景图，最后要做成 Seedance 2.0 视频。
```

Skill 会判断这属于**完整制作路线**，先交付当前阶段需要的人物、场景、道具与关键帧资产提示词；等你实际生成、选择并上传后，再根据真实引用标签进入视频镜头编译。

### 已有素材时

```text
@Image1 是验收过的男主定妆，@Image2 是餐厅场景。
让男主在争执中压住情绪，先看桌面再抬眼，不要重新设计角色和场景。
```

Skill 会走**视频直达路线**，保留已验收资产，把角色目标、倾听、眼神、呼吸、走位、机位、光线和声音组织成一个可被摄影机看见的镜头。

## 安装方式

### 方法一：让 Codex 自动安装（推荐）

在 Codex 中直接发送：

```text
请从这个公开仓库安装 Skill：
https://github.com/XT-AIGC/xiaotian-hell-grind-sop
```

Codex 会读取公开仓库并安装到个人 Skill 目录。安装后建议新开一个任务，让新 Skill 稳定出现在可用列表中。

### 方法二：使用 Codex 官方安装脚本

如果本机有 Codex 的 `skill-installer`，可运行：

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" `
  --repo XT-AIGC/xiaotian-hell-grind-sop `
  --path . `
  --name xiaotian-hell-grind-sop
```

默认安装位置：

```text
C:\Users\你的用户名\.codex\skills\xiaotian-hell-grind-sop
```

### 方法三：手动安装

1. 在仓库页面点击 **Code → Download ZIP**。
2. 解压后确认最外层目录中直接包含 `SKILL.md`。
3. 将整个文件夹命名为 `xiaotian-hell-grind-sop`。
4. 复制到：

```text
C:\Users\你的用户名\.codex\skills\xiaotian-hell-grind-sop
```

5. 新开一个 Codex 任务后使用。

> 不要只复制 `SKILL.md`。本 Skill 依赖 `references/`、`templates/`、`scripts/`、`examples/` 和内嵌组件，必须保留完整目录。

## 快速上手

安装后可以这样说：

```text
使用 $xiaotian-hell-grind-sop，帮我判断这个镜头应该先做人物/场景资产，
还是直接写 Seedance 2.0 视频提示词，并推进到当前可交付阶段。
```

更多例子：

- “先帮我做这个角色的定妆和场景关键帧，视频提示词等我上传素材后再写。”
- “我已经有角色图和场景图，直接做中文 Seedance 镜头，不要重复生图。”
- “这三张参考图分别应该负责身份、空间和首帧吗？帮我消除互相冲突的引用。”
- “把现有镜头改得更像真实表演，补足眼神、呼吸、倾听、走位和机位。”
- “图片都验收了，按我给出的真实标签进入视频阶段。”

## 核心交接规则

每项资产先使用稳定的内部 ID，例如：

```text
CHAR-01  女主身份与服装
LOC-01   便利店空间与综合色
PROP-01  被捏皱的车票
FRAME-01 镜头首帧构图
```

内部 ID 不是平台标签。只有上传后，才记录真实映射：

```text
CHAR-01 → @Image1
LOC-01  → @Image2
```

每个参考只承担明确职责。没有职责的参考会被移出当前镜头，避免多个素材争夺同一个控制维度。

## 项目结构

```text
xiaotian-hell-grind-sop/
├── SKILL.md                              # 总控规则与三条路线
├── agents/openai.yaml                    # Codex 界面名称与默认提示
├── references/
│   ├── routing-and-handoff.md            # 路由与引用交接规则
│   └── components/
│       ├── lira-image-prompts/           # 视觉资产组件
│       └── xiaotian-cinedance/           # 表演与导演镜头组件
├── templates/asset-handoff-template.md   # 资产交接模板
├── examples/full-route-example.md        # 完整路线示例
├── scripts/validate-sop.ps1              # 结构与规则验证
├── evals/                                # 路线测试与复盘记录
├── COMPONENT_MANIFEST.json               # 内嵌组件文件与哈希清单
└── SOURCE_NOTES.md                       # 来源与权利边界
```

## 验证安装

进入 Skill 目录后运行：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\validate-sop.ps1"
```

验证通过时会看到：

```text
[PASS] xiaotian-Hell Grind-sop结构、路由、语言与组件完整性验证通过。
```

## 更新

为了避免覆盖你自行修改过的内容，建议先备份旧目录，再重新安装公开仓库最新版。Codex 官方安装脚本遇到同名目录时会停止，不会直接覆盖。

安全更新流程：

1. 将现有 `xiaotian-hell-grind-sop` 文件夹复制一份作为备份。
2. 删除或重命名原安装目录。
3. 按上方任一安装方式重新安装。
4. 运行验证脚本，并新开 Codex 任务。

## 卸载

关闭正在使用该 Skill 的任务后，删除个人 Skill 目录中的：

```text
C:\Users\你的用户名\.codex\skills\xiaotian-hell-grind-sop
```

重新打开 Codex 任务即可。

## 权利与使用边界

本仓库内嵌的 LIRA 与 ACTING/CINEDANCE 源文档未提供可确认的公开许可证或作者授权信息。仓库公开不等于授予复制、修改、销售或再分发许可，也不代表对第三方组件权利作出保证。

使用、分享或商业化前，请自行确认相关来源、版权和许可范围。详细记录见 [`SOURCE_NOTES.md`](SOURCE_NOTES.md) 与 [`COMPONENT_MANIFEST.json`](COMPONENT_MANIFEST.json)。

---

如果这个 Skill 对你的 AI 影视工作流有帮助，可以收藏仓库，后续更新将继续围绕“从会生成，做成能成片”推进。
