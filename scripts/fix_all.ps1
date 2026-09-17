# fix_all.ps1
# Corrige TODAS las rutas rotas en los .html del directorio raíz.
# Los archivos son UTF-8 válidos — solo se actualizan las rutas.
#
# Cambios:
#   href="styles.css"        → href="assets/css/styles.css"
#   src="room-carousel.js"   → src="assets/js/room-carousel.js"
#   src="img/               → src="assets/img/
#   src="icons/             → src="assets/icons/

$root      = Split-Path $PSScriptRoot -Parent
$htmlFiles = Get-ChildItem -Path $root -Filter "*.html" -File
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$corrected = 0
$total     = $htmlFiles.Count

Write-Host ""
Write-Host "=== Corrigiendo rutas en $total archivos HTML ==="
Write-Host ""

foreach ($file in $htmlFiles) {

    # Leer bytes raw y decodificar como UTF-8
    $rawBytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $content  = $utf8NoBom.GetString($rawBytes)
    $original = $content

    # --- Correcciones de rutas ---
    $content = $content.Replace('href="styles.css"',       'href="assets/css/styles.css"')
    $content = $content.Replace("href='styles.css'",       "href='assets/css/styles.css'")
    $content = $content.Replace('src="room-carousel.js"',  'src="assets/js/room-carousel.js"')
    $content = $content.Replace("src='room-carousel.js'",  "src='assets/js/room-carousel.js'")
    $content = $content.Replace('src="img/',               'src="assets/img/')
    $content = $content.Replace("src='img/",               "src='assets/img/")
    $content = $content.Replace('src="icons/',             'src="assets/icons/')
    $content = $content.Replace("src='icons/",             "src='assets/icons/")

    if ($content -ne $original) {
        # Guardar como UTF-8 sin BOM, preservando saltos de línea originales
        $outBytes = $utf8NoBom.GetBytes($content)
        [System.IO.File]::WriteAllBytes($file.FullName, $outBytes)
        $corrected++
        Write-Host "  [RUTAS CORREGIDAS]  $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "  [SIN CAMBIOS]       $($file.Name)"
    }
}

Write-Host ""
Write-Host ("=" * 50)
Write-Host "Archivos actualizados: $corrected / $total"
Write-Host ""

# --- Verificación post-fix ---
Write-Host "=== Verificacion: buscando rutas rotas residuales ==="
$remaining = 0
foreach ($file in $htmlFiles) {
    $rawBytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $content  = $utf8NoBom.GetString($rawBytes)
    
    $broken = @()
    if ($content -contains 'href="styles.css"')     { $broken += "styles.css" }
    if ($content.Contains('src="img/'))              { $broken += 'src=img/' }
    if ($content.Contains('src="room-carousel.js"')) { $broken += 'room-carousel.js' }
    if ($content.Contains('src="icons/'))            { $broken += 'src=icons/' }
    
    if ($broken.Count -gt 0) {
        Write-Host "  [PENDIENTE] $($file.Name): $($broken -join ', ')" -ForegroundColor Red
        $remaining++
    } else {
        Write-Host "  [OK]        $($file.Name)" -ForegroundColor Cyan
    }
}

Write-Host ""
if ($remaining -eq 0) {
    Write-Host "Todas las rutas estan correctas. Proceso completado." -ForegroundColor Green
} else {
    Write-Host "ATENCION: $remaining archivos tienen rutas pendientes." -ForegroundColor Red
}
