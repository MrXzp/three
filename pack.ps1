# 三角洲陪玩平台 - 一键打包脚本
$projectDir = "D:\Users\Lenovo\.openclaw\workspace\admin-system"
$outputFile = "$projectDir\admin-system.zip"

Write-Host "========================================" -ForegroundColor Green
Write-Host "   打包中...   " -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

$excludePatterns = @(".git", "node_modules", "__pycache__", "*.pyc", "logs", "*.log", "db.sqlite3")

if (Test-Path $outputFile) {
    Remove-Item $outputFile -Force
}

$files = Get-ChildItem -Path $projectDir -Recurse -File | Where-Object {
    $relativePath = $_.FullName.Substring($projectDir.Length + 1)
    $shouldExclude = $false
    foreach ($pattern in $excludePatterns) {
        if ($relativePath -like "$pattern*") {
            $shouldExclude = $true
            break
        }
    }
    -not $shouldExclude
}

Compress-Archive -Path $files.FullName -DestinationPath $outputFile -CompressionLevel Optimal

$fileSize = [math]::Round((Get-Item $outputFile).Length / 1MB, 2)
Write-Host "OK!" -ForegroundColor Green
Write-Host "File: $outputFile" -ForegroundColor Cyan
Write-Host "Size: $fileSize MB" -ForegroundColor Cyan
