param([string]$SkillRoot = (Split-Path -Parent $PSScriptRoot))

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()

function Require-Text {
    param([string]$Path, [string[]]$Terms)
    if (-not (Test-Path -LiteralPath $Path)) {
        $script:failures.Add("缺少输出：$Path")
        return
    }
    $text = Get-Content -LiteralPath $Path -Raw -Encoding UTF8
    foreach ($term in $Terms) {
        if (-not $text.Contains($term)) { $script:failures.Add("$Path 缺少：$term") }
    }
}

$eval1 = Join-Path $SkillRoot 'evals/iteration-1/eval-1-full-route/output.md'
$eval2 = Join-Path $SkillRoot 'evals/iteration-1/eval-2-video-direct/output.md'
$eval3 = Join-Path $SkillRoot 'evals/iteration-1/eval-3-image-edit/output.md'
$eval4 = Join-Path $SkillRoot 'evals/iteration-1/eval-4-no-fake-tags/output.md'

Require-Text $eval1 @('CHAR-01', 'LOC-01', 'Three studio photographs', 'Eye-level three-quarter wide view', '当前不输出最终视频提示词')
Require-Text $eval2 @('@Image1', '@Image2', '第一帧', '角色表演与镜头', '分段动作')
Require-Text $eval3 @('CHANGE:', 'PRESERVE EXACTLY:', 'ONLY CHANGE:', 'Nano Banana Pro')
Require-Text $eval4 @('尚未上传', '真实标签', '不会把内部资产ID')

if ((Get-Content -LiteralPath $eval1 -Raw -Encoding UTF8) -match '@Image[0-9]+') {
    $failures.Add('完整路线资产阶段不应出现平台@Image标签')
}
if ((Get-Content -LiteralPath $eval3 -Raw -Encoding UTF8) -match 'Seedance 2\.0 成品提示词|【角色表演') {
    $failures.Add('图片编辑路线错误加载了视频表演输出')
}

if ($failures.Count -gt 0) {
    Write-Host "[FAIL] 路由输出测试失败，共$($failures.Count)项：" -ForegroundColor Red
    foreach ($failure in $failures) { Write-Host " - $failure" -ForegroundColor Red }
    exit 1
}

Write-Host '[PASS] 四组总控路由与交接输出断言通过。' -ForegroundColor Green
exit 0

