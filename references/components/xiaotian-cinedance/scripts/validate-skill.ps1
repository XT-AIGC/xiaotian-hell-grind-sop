param(
    [string]$SkillRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()

function Assert-Condition {
    param(
        [bool]$Condition,
        [string]$Message
    )
    if (-not $Condition) {
        $script:failures.Add($Message)
    }
}

$requiredFiles = @(
    'SKILL.md',
    'agents/openai.yaml',
    'references/acting-performance-system.md',
    'references/cinedance-directing-system.md',
    'references/integration-rules.md',
    'templates/final-seedance-prompt-template.md',
    'examples/integrated-dialogue-shot.md',
    'SOURCE_NOTES.md',
    'README.md'
)

foreach ($relativePath in $requiredFiles) {
    Assert-Condition (Test-Path -LiteralPath (Join-Path $SkillRoot $relativePath)) "缺少文件：$relativePath"
}

$skillPath = Join-Path $SkillRoot 'SKILL.md'
if (Test-Path -LiteralPath $skillPath) {
    $skill = Get-Content -LiteralPath $skillPath -Raw -Encoding UTF8
    $lineCount = (Get-Content -LiteralPath $skillPath -Encoding UTF8).Count
    $folderName = Split-Path $SkillRoot -Leaf

    Assert-Condition ($skill -match '(?ms)^---\s*.*?^name:\s*xiaotian-cinedance\s*$.*?^description:\s*>?-?\s*$?.*?^---\s*$') 'YAML frontmatter 缺少正确的 name 或 description'
    Assert-Condition ($folderName -eq 'xiaotian-cinedance') '目录名必须与 frontmatter name 一致'
    Assert-Condition ($skill -match 'description:[\s\S]{0,80}Use when') 'description 必须以 Use when 触发语义开始'
    Assert-Condition ($skill -match '默认直接输出简体中文成品提示词') '缺少默认中文输出规则'
    Assert-Condition ($skill -match 'references/acting-performance-system\.md') '主 Skill 未路由到表演模块'
    Assert-Condition ($skill -match 'references/cinedance-directing-system\.md') '主 Skill 未路由到导演模块'
    Assert-Condition ($skill -match 'references/integration-rules\.md') '主 Skill 未路由到融合规则'
    Assert-Condition ($lineCount -le 500) "SKILL.md 共 $lineCount 行，超过500行建议上限"
    Assert-Condition ($skill -notmatch 'final prompt must be written in clear cinematic English') '仍残留强制英文输出规则'
}

$actingPath = Join-Path $SkillRoot 'references/acting-performance-system.md'
if (Test-Path -LiteralPath $actingPath) {
    $acting = Get-Content -LiteralPath $actingPath -Raw -Encoding UTF8
    foreach ($term in @('目标', '阻碍', '策略', '节拍', '倾听', '眼神生命', '手上事务', '状态惯性')) {
        Assert-Condition ($acting.Contains($term)) "表演模块缺少关键概念：$term"
    }
}

$directingPath = Join-Path $SkillRoot 'references/cinedance-directing-system.md'
if (Test-Path -LiteralPath $directingPath) {
    $directing = Get-Content -LiteralPath $directingPath -Raw -Encoding UTF8
    foreach ($term in @('首帧', '空间调度', '视线', '单镜头', '视场', '物理', '灯光', '对白', '连续性')) {
        Assert-Condition ($directing.Contains($term)) "导演模块缺少关键概念：$term"
    }
}

$integrationPath = Join-Path $SkillRoot 'references/integration-rules.md'
if (Test-Path -LiteralPath $integrationPath) {
    $integration = Get-Content -LiteralPath $integrationPath -Raw -Encoding UTF8
    Assert-Condition ($integration -match '表演如何驱动摄影') '融合规则未定义表演驱动摄影'
    Assert-Condition ($integration -match '目标与压力.+摄影覆盖') '融合规则未定义完整因果链'
}

$evalPath = Join-Path $SkillRoot 'evals/evals.json'
if (Test-Path -LiteralPath $evalPath) {
    try {
        $evalData = Get-Content -LiteralPath $evalPath -Raw -Encoding UTF8 | ConvertFrom-Json
        Assert-Condition ($evalData.skill_name -eq 'xiaotian-cinedance') 'evals.json 的 skill_name 不正确'
        Assert-Condition (@($evalData.evals).Count -ge 3) '至少需要3个代表性测试场景'
        foreach ($eval in @($evalData.evals)) {
            Assert-Condition (-not [string]::IsNullOrWhiteSpace($eval.prompt)) "测试 $($eval.id) 缺少 prompt"
            Assert-Condition (-not [string]::IsNullOrWhiteSpace($eval.expected_output)) "测试 $($eval.id) 缺少 expected_output"
        }
    }
    catch {
        $failures.Add("evals.json 无法解析：$($_.Exception.Message)")
    }
}

if ($failures.Count -gt 0) {
    Write-Host "[FAIL] Skill 验证失败，共 $($failures.Count) 项：" -ForegroundColor Red
    foreach ($failure in $failures) {
        Write-Host " - $failure" -ForegroundColor Red
    }
    exit 1
}

Write-Host '[PASS] xiaotian-cinedance 结构与核心内容验证通过。' -ForegroundColor Green
exit 0
