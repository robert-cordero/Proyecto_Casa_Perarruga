# find_accent_bytes.ps1
# Encuentra qué bytes exactos tiene la 'á' en los archivos HTML

$root = Split-Path $PSScriptRoot -Parent
$file = Join-Path $root "index.html"

$rawBytes = [System.IO.File]::ReadAllBytes($file)

Write-Host "Total bytes en index.html: $($rawBytes.Length)"
Write-Host ""

# Buscar la secuencia ASCII para "Poz"
# P=80, o=111, z=122
for ($i = 0; $i -lt ($rawBytes.Length - 20); $i++) {
    if ($rawBytes[$i] -eq 80 -and $rawBytes[$i+1] -eq 111 -and $rawBytes[$i+2] -eq 122) {
        $windowSize = [Math]::Min(40, $rawBytes.Length - $i)
        $window = $rawBytes[$i..($i + $windowSize - 1)]
        
        Write-Host "Encontrado 'Poz' en posicion $i"
        Write-Host "Bytes hex: $(($window | ForEach-Object { $_.ToString('X2') }) -join ' ')"
        Write-Host "Bytes dec: $($window -join ' ')"
        Write-Host ""
        
        # Decodificar con diferentes codificaciones
        $latin1 = [System.Text.Encoding]::GetEncoding("iso-8859-1")
        $utf8   = [System.Text.Encoding]::UTF8
        $cp1252 = [System.Text.Encoding]::GetEncoding("windows-1252")
        
        Write-Host "Como Latin-1  : $($latin1.GetString($window))"
        try { Write-Host "Como UTF-8    : $($utf8.GetString($window))" }
        catch { Write-Host "Como UTF-8    : ERROR (bytes inválidos)" }
        Write-Host "Como CP1252   : $($cp1252.GetString($window))"
        Write-Host ""
        break
    }
}
