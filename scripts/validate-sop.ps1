param(
    [string]$SkillRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()

function Assert-Condition {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { $script:failures.Add($Message) }
}

$required = @(
    'SKILL.md',
    'agents/openai.yaml',
    'references/routing-and-handoff.md',
    'references/components/lira-image-prompts/SKILL.md',
    'references/components/xiaotian-cinedance/SKILL.md',
    'templates/asset-handoff-template.md',
    'examples/full-route-example.md',
    'COMPONENT_MANIFEST.json',
    'SOURCE_NOTES.md',
    'README.md'
)

foreach ($relative in $required) {
    Assert-Condition (Test-Path -LiteralPath (Join-Path $SkillRoot $relative)) "缺少文件：$relative"
}

$skillPath = Join-Path $SkillRoot 'SKILL.md'
if (Test-Path -LiteralPath $skillPath) {
    $skill = Get-Content -LiteralPath $skillPath -Raw -Encoding UTF8
    $folder = Split-Path $SkillRoot -Leaf
    $lines = (Get-Content -LiteralPath $skillPath -Encoding UTF8).Count
    Assert-Condition ($folder -eq 'xiaotian-hell-grind-sop') '目录技术名不正确'
    Assert-Condition ($skill -match '(?m)^name:\s*xiaotian-hell-grind-sop\s*$') 'frontmatter技术名不正确'
    Assert-Condition ($skill -match 'description:[\s\S]{0,80}Use when') 'description缺少Use when触发语义'
    Assert-Condition ($skill -match '视觉资产路线') '缺少视觉资产路线'
    Assert-Condition ($skill -match '视频直达路线') '缺少视频直达路线'
    Assert-Condition ($skill -match '完整制作路线') '缺少完整制作路线'
    Assert-Condition ($skill -match '图片模型核心提示词使用英文') '缺少图片提示词英文默认规则'
    Assert-Condition ($skill -match '简体中文 Seedance 2\.0') '缺少视频提示词中文默认规则'
    Assert-Condition ($skill -match '不替用户编号') '缺少禁止虚构上传标签规则'
    Assert-Condition ($lines -le 500) "SKILL.md共$lines行，超过500行"
}

$yamlPath = Join-Path $SkillRoot 'agents/openai.yaml'
if (Test-Path -LiteralPath $yamlPath) {
    $yaml = Get-Content -LiteralPath $yamlPath -Raw -Encoding UTF8
    Assert-Condition ($yaml -match 'display_name:\s*"xiaotian-Hell Grind-sop"') '用户可见名称不正确'
    Assert-Condition ($yaml -match '\$xiaotian-hell-grind-sop') '默认调用名不正确'
}

$manifestPath = Join-Path $SkillRoot 'COMPONENT_MANIFEST.json'
if (Test-Path -LiteralPath $manifestPath) {
    try {
        $manifest = Get-Content -LiteralPath $manifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
        Assert-Condition (@($manifest.components).Count -eq 11) '组件清单必须包含11个文件'
        foreach ($entry in @($manifest.components)) {
            $path = Join-Path $SkillRoot ($entry.path -replace '/', '\')
            if (-not (Test-Path -LiteralPath $path)) {
                $failures.Add("组件缺失：$($entry.path)")
                continue
            }
            $item = Get-Item -LiteralPath $path
            $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash
            Assert-Condition ($item.Length -eq [long]$entry.bytes) "组件大小变化：$($entry.path)"
            Assert-Condition ($hash -eq $entry.sha256) "组件哈希变化：$($entry.path)"
        }
    }
    catch {
        $failures.Add("组件清单无法解析：$($_.Exception.Message)")
    }
}

$evalPath = Join-Path $SkillRoot 'evals/evals.json'
if (Test-Path -LiteralPath $evalPath) {
    try {
        $evals = Get-Content -LiteralPath $evalPath -Raw -Encoding UTF8 | ConvertFrom-Json
        Assert-Condition ($evals.skill_name -eq 'xiaotian-hell-grind-sop') 'evals skill_name不正确'
        Assert-Condition (@($evals.evals).Count -ge 4) '至少需要4个路由与交接测试'
    }
    catch {
        $failures.Add("evals.json无法解析：$($_.Exception.Message)")
    }
}

Assert-Condition (-not (Test-Path -LiteralPath (Join-Path $SkillRoot 'references/components/xiaotian-cinedance/evals'))) '不应内嵌xiaotian-CINEDANCE开发期evals'

if ($failures.Count -gt 0) {
    Write-Host "[FAIL] xiaotian-Hell Grind-sop验证失败，共$($failures.Count)项：" -ForegroundColor Red
    foreach ($failure in $failures) { Write-Host " - $failure" -ForegroundColor Red }
    exit 1
}

Write-Host '[PASS] xiaotian-Hell Grind-sop结构、路由、语言与组件完整性验证通过。' -ForegroundColor Green
exit 0

