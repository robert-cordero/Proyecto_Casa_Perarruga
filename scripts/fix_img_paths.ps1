# fix_img_paths.ps1
# Corrige todas las rutas de imágenes en los .html del directorio raíz.
#
# Los HTML usan la ruta antigua:  imgs/...
# Las imágenes están ahora en:   assets/img/...
#
# También corrige:
#   styles.css        -> assets/css/styles.css
#   room-carousel.js  -> assets/js/room-carousel.js
#   icons/            -> assets/icons/

$root      = Split-Path $PSScriptRoot -Parent
$htmlFiles = Get-ChildItem -Path $root -Filter "*.html" -File
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$corrected = 0
$total     = $htmlFiles.Count

Write-Host ""
Write-Host "=== Corrigiendo rutas en $total archivos HTML ===" -ForegroundColor Cyan
Write-Host "  imgs/   →  assets/img/"
Write-Host "  img/    →  assets/img/"
Write-Host "  icons/  →  assets/icons/"
Write-Host "  styles.css  →  assets/css/styles.css"
Write-Host "  room-carousel.js  →  assets/js/room-carousel.js"
Write-Host ""

foreach ($file in $htmlFiles) {

    # Leer bytes raw para no perder el encoding UTF-8
    $rawBytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $content  = $utf8NoBom.GetString($rawBytes)
    $original = $content

    # --- Imágenes: corregir prefijos de carpeta ---
    # Primero el más largo (imgs/) para no reemplazar dos veces
    $content = $content.Replace('src="imgs/',  'src="assets/img/')
    $content = $content.Replace("src='imgs/",  "src='assets/img/")
    # Luego img/ suelto (sin assets delante, por si acaso)
    $content = $content.Replace('src="img/',   'src="assets/img/')
    $content = $content.Replace("src='img/",   "src='assets/img/")

    # --- Iconos ---
    $content = $content.Replace('src="icons/', 'src="assets/icons/')
    $content = $content.Replace("src='icons/", "src='assets/icons/")

    # --- CSS ---
    $content = $content.Replace('href="styles.css"',      'href="assets/css/styles.css"')
    $content = $content.Replace("href='styles.css'",      "href='assets/css/styles.css'")

    # --- JavaScript ---
    $content = $content.Replace('src="room-carousel.js"', 'src="assets/js/room-carousel.js"')
    $content = $content.Replace("src='room-carousel.js'", "src='assets/js/room-carousel.js'")

    if ($content -ne $original) {
        $outBytes = $utf8NoBom.GetBytes($content)
        [System.IO.File]::WriteAllBytes($file.FullName, $outBytes)
        $corrected++
        Write-Host "  [CORREGIDO]  $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "  [SIN CAMBIOS] $($file.Name)"
    }
}

Write-Host ""
Write-Host ("=" * 52) -ForegroundColor Cyan
Write-Host "Archivos actualizados: $corrected / $total"
Write-Host ""

# ---- Verificación ----
Write-Host "=== Verificación final ===" -ForegroundColor Cyan
$issues = 0
foreach ($file in $htmlFiles) {
    $rawBytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $content  = $utf8NoBom.GetString($rawBytes)

    $broken = [System.Collections.Generic.List[string]]::new()
    if ($content.Contains('src="imgs/'))              { $null = $broken.Add('imgs/') }
    if ($content.Contains('src="img/'))               { $null = $broken.Add('img/') }
    if ($content.Contains('src="icons/'))             { $null = $broken.Add('icons/') }
    if ($content.Contains('href="styles.css"'))       { $null = $broken.Add('styles.css') }
    if ($content.Contains('src="room-carousel.js"'))  { $null = $broken.Add('room-carousel.js') }

    if ($broken.Count -gt 0) {
        Write-Host "  [PENDIENTE] $($file.Name) → $($broken -join ', ')" -ForegroundColor Red
        $issues++
    } else {
        Write-Host "  [OK]  $($file.Name)" -ForegroundColor Green
    }
}

Write-Host ""
if ($issues -eq 0) {
    Write-Host "Todas las rutas corregidas. Listo." -ForegroundColor Green
} else {
    Write-Host "ATENCION: $issues archivos con rutas pendientes." -ForegroundColor Red
}
