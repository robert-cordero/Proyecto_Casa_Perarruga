# fix_mojibake_double.ps1
#
# Corrige DOBLE Mojibake en todos los .html del directorio raíz.
#
# Diagnóstico: los bytes de 'á' son C3 83 C2 A1 (4 bytes) en lugar de C3 A1 (2 bytes).
# Esto indica que la cadena fue doblemente corruptida:
#   Paso 1: UTF-8 original leído como Latin-1  → "Ã¡"  (2 chars correctos)
#   Paso 2: "Ã¡" guardado en UTF-8              → C3 83 C2 A1 (doble encode)
#
# Solución: aplicar el ciclo Latin-1 decode → Latin-1 encode → UTF-8 decode DOS VECES.

$root      = Split-Path $PSScriptRoot -Parent
$htmlFiles = Get-ChildItem -Path $root -Filter "*.html" -File

$latin1    = [System.Text.Encoding]::GetEncoding("iso-8859-1")
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$corrected = 0
$total     = $htmlFiles.Count

Write-Host ""
Write-Host "Procesando $total archivos HTML en: $root"
Write-Host ""

foreach ($file in $htmlFiles) {

    # Leer el contenido actual como texto UTF-8
    $currentText = [System.IO.File]::ReadAllText($file.FullName, $utf8NoBom)
    $original    = $currentText

    # Aplicar la corrección de Mojibake (puede ser necesario 1 o 2 pasadas)
    $passes = 0
    for ($i = 0; $i -lt 3; $i++) {
        try {
            # Codificar el texto actual a bytes Latin-1
            $asLatin1Bytes = $latin1.GetBytes($currentText)
            # Decodificar esos bytes como UTF-8
            $recovered = $utf8NoBom.GetString($asLatin1Bytes)

            # Si la cadena cambió, había mojibake en esta pasada
            if ($recovered -ne $currentText) {
                $currentText = $recovered
                $passes++
            } else {
                break  # No hubo cambio, ya está limpio
            }
        } catch {
            break  # Error de encoding: texto ya correcto o no recuperable
        }
    }

    if ($passes -gt 0) {
        [System.IO.File]::WriteAllText($file.FullName, $currentText, $utf8NoBom)
        $corrected++
        Write-Host "  [CORREGIDO x$passes]         $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "  [SIN CAMBIOS - limpio]  $($file.Name)"
    }
}

Write-Host ""
Write-Host ("=" * 52)
Write-Host "Archivos corregidos : $corrected / $total"
Write-Host "UTF-8 sin BOM aplicado a todos los modificados."
Write-Host "Proceso completado con exito." -ForegroundColor Green
