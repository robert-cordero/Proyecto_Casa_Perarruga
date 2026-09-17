# check_encoding.ps1
# Verifica el estado real del encoding en los archivos HTML

$file = Join-Path (Split-Path $PSScriptRoot -Parent) "index.html"
$utf8 = [System.Text.Encoding]::UTF8

$content = [System.IO.File]::ReadAllText($file, $utf8)

# Buscar lineas con texto sospechoso
$suspicious = $content -split "`n" | Where-Object { $_ -match "Ã|Â" }
Write-Host "=== Lineas con posible mojibake en index.html ==="
$suspicious | Select-Object -First 8 | ForEach-Object {
    Write-Host $_
}

# Mostrar los bytes de la primera ocurrencia de "n de Vero"
$idx = $content.IndexOf("Poz")
if ($idx -ge 0) {
    $sample = $content.Substring($idx, [Math]::Min(30, $content.Length - $idx))
    Write-Host ""
    Write-Host "=== Muestra de texto: ==="
    Write-Host $sample

    Write-Host ""
    Write-Host "=== Bytes UTF-8 de esa muestra: ==="
    $bytes = $utf8.GetBytes($sample)
    Write-Host ($bytes -join " ")
}
