# verify_content.ps1
# Verifica qué hay realmente en los archivos HTML

$root = Split-Path $PSScriptRoot -Parent
$file = Join-Path $root "index.html"
$utf8 = New-Object System.Text.UTF8Encoding($false)

$content = [System.IO.File]::ReadAllText($file, $utf8)

# Buscar "Poz" y mostrar contexto
$idx = $content.IndexOf("Poz")
if ($idx -ge 0) {
    $sample = $content.Substring($idx, 40)
    Write-Host "=== Muestra de texto ==="
    Write-Host $sample
    Write-Host ""
}

# Verificar si existen cadenas mojibake literales
$hasMojibake = $content.Contains("Ã¡") -or $content.Contains("Â·") -or $content.Contains("Ã©")
Write-Host "=== Tiene mojibake literal (Ã¡, Â·, etc.)? ==="
Write-Host $hasMojibake
Write-Host ""

# Verificar si tiene caracteres acentuados correctos
$hasAccents = $content.Contains("á") -or $content.Contains("é") -or $content.Contains("ó")
Write-Host "=== Tiene vocales acentuadas correctas (á, é, ó)? ==="
Write-Host $hasAccents

# Verificar rutas
$hasBrokenPaths = $content.Contains('src="img/') -or $content.Contains('href="styles.css"')
Write-Host ""
Write-Host "=== Tiene rutas rotas (src=img/, href=styles.css)? ==="
Write-Host $hasBrokenPaths

$hasFixedPaths = $content.Contains('assets/img/') -or $content.Contains('assets/css/')
Write-Host "=== Tiene rutas corregidas (assets/img/, assets/css/)? ==="
Write-Host $hasFixedPaths
