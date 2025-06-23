# Jekyll Build Validation Script
# Validates that all prompts are properly configured and the site will build correctly

Write-Host "🔍 Validating Jekyll Site Configuration..." -ForegroundColor Green

# Check prompt files
$promptFiles = Get-ChildItem "_prompts\*.md"
Write-Host "📄 Found $($promptFiles.Count) prompt files" -ForegroundColor Blue

# Check for YAML frontmatter issues
$yamlIssues = @()
foreach ($file in $promptFiles) {
    $content = Get-Content $file.FullName -Raw
    if (-not ($content -match '^---\s*\n.*?\n---\s*\n')) {
        $yamlIssues += $file.Name
    }
}

if ($yamlIssues.Count -eq 0) {
    Write-Host "✅ All prompt files have valid YAML frontmatter" -ForegroundColor Green
} else {
    Write-Host "❌ YAML issues found in: $($yamlIssues -join ', ')" -ForegroundColor Red
}

# Check data files
$dataFiles = @("_data\categories.yml", "_data\packs.yml")
foreach ($file in $dataFiles) {
    if (Test-Path $file) {
        $content = Get-Content $file
        Write-Host "✅ $file exists with $($content.Count) lines" -ForegroundColor Green
    } else {
        Write-Host "❌ Missing: $file" -ForegroundColor Red
    }
}

# Check template consistency
$templates = @("index.html", "prompts.html", "categories.html")
$inconsistencies = @()

foreach ($template in $templates) {
    if (Test-Path $template) {
        $content = Get-Content $template -Raw
        if ($content -match 'site\.categories[^.]' -and $content -notmatch 'site\.data\.categories') {
            $inconsistencies += "$template uses site.categories instead of site.data.categories"
        }
        if ($content -match 'site\.packs[^.]' -and $content -notmatch 'site\.data\.packs') {
            $inconsistencies += "$template uses site.packs instead of site.data.packs"
        }
    }
}

if ($inconsistencies.Count -eq 0) {
    Write-Host "✅ All templates use consistent data sources" -ForegroundColor Green
} else {
    Write-Host "❌ Data source inconsistencies:" -ForegroundColor Red
    $inconsistencies | ForEach-Object { Write-Host "   $_" -ForegroundColor Yellow }
}

# Summary
Write-Host "`n📊 Validation Summary:" -ForegroundColor Cyan
Write-Host "   Prompt files: $($promptFiles.Count)" -ForegroundColor White
Write-Host "   YAML issues: $($yamlIssues.Count)" -ForegroundColor White
Write-Host "   Data inconsistencies: $($inconsistencies.Count)" -ForegroundColor White

if ($yamlIssues.Count -eq 0 -and $inconsistencies.Count -eq 0) {
    Write-Host "`n🎉 Site is ready for Jekyll build!" -ForegroundColor Green
    Write-Host "   All $($promptFiles.Count) prompts should render correctly" -ForegroundColor Green
} else {
    Write-Host "`n⚠️  Please fix the issues above before building" -ForegroundColor Yellow
}
