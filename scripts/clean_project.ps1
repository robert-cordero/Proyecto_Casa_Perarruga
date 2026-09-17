$ErrorActionPreference = "Stop"

# 1. Crear carpeta para scripts y moverlos
Write-Host "Creando directorio scripts/..."
New-Item -ItemType Directory -Force -Path "scripts" | Out-Null

Write-Host "Moviendo archivos .ps1 y .py a scripts/..."
Get-ChildItem -Path . -File | Where-Object { $_.Extension -match "\.(ps1|py)$" } | Move-Item -Destination "scripts\" -Force

# 2. Unificar carpetas de imágenes
if (Test-Path "imgs") {
    Write-Host "Fusionando imgs/ en img/..."
    New-Item -ItemType Directory -Force -Path "img" | Out-Null
    Copy-Item -Path "imgs\*" -Destination "img\" -Recurse -Force
    Remove-Item -Path "imgs" -Recurse -Force
    Write-Host "Carpeta imgs/ eliminada."
}

# 3. Actualizar rutas en archivos HTML y CSS
Write-Host "Actualizando rutas de imgs/ a img/ en archivos .html y styles.css..."
$files = Get-ChildItem -Path . -File | Where-Object { $_.Extension -eq ".html" -or $_.Name -eq "styles.css" }

foreach ($file in $files) {
    # Usar -Raw para cargar el archivo completo como un solo string, mucho más rápido y seguro
    $content = Get-Content $file.FullName -Raw
    if ($content -match "imgs/") {
        $newContent = $content -replace "imgs/", "img/"
        # Importante: forzar UTF-8 para no romper caracteres especiales o emojis
        [System.IO.File]::WriteAllText($file.FullName, $newContent, [System.Text.Encoding]::UTF8)
        Write-Host "  Actualizado: $($file.Name)"
    }
}

Write-Host "¡Limpieza completada con éxito!"
