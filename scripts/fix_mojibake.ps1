# fix_mojibake.ps1
# Corrige el Mojibake en todos los .html del directorio raíz.
#
# Estrategia:
#   Los archivos tienen bytes UTF-8 válidos pero en algún momento fueron
#   leídos como Latin-1 y guardados de nuevo, produciendo secuencias como
#   Ã¡ (que es á codificado en UTF-8 e interpretado como Latin-1).
#
#   Solución:
#     1. Leer los bytes raw del archivo.
#     2. Decodificar esos bytes como Latin-1 → obtenemos una cadena .NET con los
#        caracteres Latin-1 corruptos (ej. "Ã¡").
#     3. Re-codificar esa cadena .NET a bytes como Latin-1 → recuperamos los bytes
#        UTF-8 originales.
#     4. Decodificar esos bytes como UTF-8 → texto correcto ("á").
#     5. Guardar como UTF-8 sin BOM.

$root = Split-Path $PSScriptRoot -Parent
$htmlFiles = Get-ChildItem -Path $root -Filter "*.html" -File

$latin1  = [System.Text.Encoding]::GetEncoding("iso-8859-1")
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)  # $false = sin BOM

$corrected = 0
$total     = $htmlFiles.Count

Write-Host ""
Write-Host "Procesando $total archivos HTML en: $root"
Write-Host ""

foreach ($file in $htmlFiles) {
    # 1. Leer bytes raw
    $rawBytes = [System.IO.File]::ReadAllBytes($file.FullName)

    # 2. Decodificar como Latin-1 (siempre funciona, 1-to-1)
    $latinStr = $latin1.GetString($rawBytes)

    # 3. Re-codificar a Latin-1 para recuperar los bytes UTF-8 originales
    try {
        $recoveredBytes = $latin1.GetBytes($latinStr)
    } catch {
        Write-Host "  [ERROR re-encode]      $($file.Name)"
        continue
    }

    # 4. Decodificar los bytes recuperados como UTF-8
    try {
        $fixedStr = $utf8NoBom.GetString($recoveredBytes)
    } catch {
        Write-Host "  [SIN CAMBIOS - no UTF8] $($file.Name)"
        continue
    }

    # 5. Comprobar si el archivo original ya era UTF-8 limpio
    try {
        $originalStr = $utf8NoBom.GetString($rawBytes)
    } catch {
        $originalStr = $null
    }

    if ($null -ne $originalStr -and $originalStr -eq $fixedStr) {
        Write-Host "  [SIN CAMBIOS - limpio]  $($file.Name)"
        continue
    }

    # 6. Guardar como UTF-8 sin BOM
    [System.IO.File]::WriteAllText($file.FullName, $fixedStr, $utf8NoBom)
    $corrected++
    Write-Host "  [CORREGIDO]            $($file.Name)" -ForegroundColor Green
}

Write-Host ""
Write-Host ("=" * 52)
Write-Host "Archivos corregidos : $corrected / $total"
Write-Host "UTF-8 sin BOM aplicado a todos los modificados."
Write-Host "Proceso completado con exito." -ForegroundColor Green
