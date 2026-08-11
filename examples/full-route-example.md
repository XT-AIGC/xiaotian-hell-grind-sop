# 完整路线示例

## 用户输入

```text
我要做一个10秒Seedance镜头：30岁女特工在雨夜进入废弃教堂，发现祭坛后有人。现在没有人物图和场景图，先做资产，再做视频。
```

## 第一阶段应交付

```markdown
# 当前制作状态
- 当前路线：完整制作
- 当前阶段：资产设计
- 当前镜头目标：女特工进入废弃教堂，并在祭坛后发现未知人物。

## 资产清单
| asset_id | 类型 | 目标模型 | 平台参数 | 主要职责 | 状态 | 实际标签 |
|---|---|---|---|---|---|---|
| CHAR-01 | character | Soul 2.0 | 16:9、2K、Soul ID待建立 | identity | planned | 待上传 |
| LOC-01 | location | Soul Cinema | 16:9、2K | environment | planned | 待上传 |

## CHAR-01人物提示词
```text
Three studio photographs of the same real 30-year-old female field operative arranged side by side on a neutral mid-grey studio backdrop, a film character sheet. She has a compact athletic build, alert deep-set eyes, rain-darkened shoulder-length black hair, a narrow scar crossing the left eyebrow, and controlled watchful stillness. Full-body front photograph on the left, full-body back photograph in the middle, close-up head-and-shoulders portrait on the right, the same real person and identical practical dark raincoat in all three panels. Soft directional studio light from one side, natural skin and fabric texture, clean photographic realism.
```

## LOC-01场景提示词
```text
Eye-level three-quarter wide view from just inside the entrance of an abandoned stone church at night. A long wet central aisle leads toward a damaged altar; broken wooden pews recede on both sides, rain enters through missing roof tiles, and a narrow service passage remains visible behind the altar. Cold moonlight falls from high camera-left through cracked stained glass, while a weak amber votive glow survives near the altar. Real wet stone, aged dark timber, restrained natural grain, immediately readable geography and deep shadow behind the altar.
```

## 当前交接
- 已完成：人物与场景资产提示词。
- 待完成：实际生成、选择验收、上传到视频平台、记录真实标签。
- 视频提示词：暂不生成，不能把CHAR-01或LOC-01伪装成@Image标签。
```

## 用户确认上传后的交接示例

```text
CHAR-01 → @Image1，职责：人物身份、体型、服装和左眉疤痕。
LOC-01 → @Image2，职责：教堂地理、材质、祭坛位置和主光方向；不继承原图机位。
```

此时才读取`xiaotian-CINEDANCE`，基于实际标签输出中文Seedance 2.0视频提示词。

