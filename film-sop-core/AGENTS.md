# H团队视频提示词｜Codex 项目调度规则

## 唯一核心
本项目的唯一核心业务层指令为用户指定的 `higgsfield-seedance-prompt-builder.md`（HIGGSFIELD SEEDANCE PROMPT BUILDER v4.4.2）。本包不覆盖、不复制替换该核心文件。请将该核心文件保存在项目根目录，确保实际存在后再投入使用。任何辅助 Skill 的内容与核心指令冲突时，以核心指令为准（但不得覆盖平台更高层约束）。

## 辅助 Skill 路由
- `skills/higgsfield-acting-skill/SKILL.md`：涉及角色动机、眼神、潜台词、聆听、对白与情绪表演时读取；只借鉴表演诊断和可执行设计。
- `skills/higgsfield-fight-scene/SKILL.md`：涉及近身搏斗、武术、截拳道或咏春编排时读取；按需再读其 references。非人形魔法战斗仅使用适用的物理节拍，不强制套用武术体系。
- `skills/anamorphic-look/SKILL.md`：明确要求变形镜头、椭圆焦外、水平耀斑、宽银幕胶片质感时读取；没有要求时不叠加镜头效果。

- `skills/higgsfield-prompt-engine/SKILL.md`：用户提出剧情、剧本、场景结构、人物目标、障碍、策略、反转或观众认知变化的创作与诊断时读取。用其 Goal → Obstacle → Tactic → Reversal → Value Shift 五元素体系优化剧本；在后续生成 Seedance 提示词时仍以 v4.4.2 核心指令统筹。

## 输出优先级
按照核心指令先分析可行性、首帧、人物站位、机位、FOV、节拍和物理连续性，再按剧情选用辅助能力，最终合成为一条清洁的 Seedance 提示词。默认面向用户输出中文提示词；英文对白或旁白可按用户要求在括号附中文注释。不得让辅助 Skill 的固定格式、语言规则、默认特效或特定角色名称覆盖用户要求或核心指令。未触发的辅助 Skill 不应加入提示词。
