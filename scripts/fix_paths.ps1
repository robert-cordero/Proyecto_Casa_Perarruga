# fix_paths.ps1
# Corrige las rutas rotas en todos los .html tras reorganizar a assets/css, assets/js, assets/img, assets/icons

$root = Split-Path $PSScriptRoot -Parent
$htmlFiles = Get-ChildItem -Path $root -Filter "*.html" -File

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $original = $content

    # 1. CSS: href="styles.css" -> href="assets/css/styles.css"
    $content = $content -replace 'href="styles\.css"', 'href="assets/css/styles.css"'

    # 2. JS: src="room-carousel.js" -> src="assets/js/room-carousel.js"
    $content = $content -replace 'src="room-carousel\.js"', 'src="assets/js/room-carousel.js"'

    # 3. Imagenes: src="img/ -> src="assets/img/
    $content = $content -replace 'src="img/', 'src="assets/img/'

    # 4. Iconos: src="icons/ -> src="assets/icons/
    $content = $content -replace 'src="icons/', 'src="assets/icons/"'

    if ($content -ne $original) {
        Set-Content $file.FullName $content -Encoding UTF8 -NoNewline
        Write-Host "Actualizado: $($file.Name)"
    } else {
        Write-Host "Sin cambios: $($file.Name)"
    }
}

Write-Host ""
Write-Host "Proceso completado." -ForegroundColor Green
