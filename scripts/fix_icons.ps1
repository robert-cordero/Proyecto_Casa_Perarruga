# fix_icons.ps1
# Corrige el problema de comillas dobles extras en los iconos de la-casa.html

$file = Join-Path (Split-Path $PSScriptRoot -Parent) "la-casa.html"
$content = Get-Content $file -Raw -Encoding UTF8

# El problema: src="assets/icons/"google-maps.svg"  -> debe ser src="assets/icons/google-maps.svg"
$broken = 'src="assets/icons/"google-maps.svg"'
$fixed  = 'src="assets/icons/google-maps.svg"'

$count = ([regex]::Matches($content, [regex]::Escape($broken))).Count
Write-Host "Ocurrencias encontradas: $count"

$content = $content.Replace($broken, $fixed)

Set-Content $file $content -Encoding UTF8 -NoNewline
Write-Host "Archivo corregido: la-casa.html" -ForegroundColor Green
