# inspect_bytes.ps1
# Inspecciona los bytes RAW del archivo para entender la codificación real

$file = Join-Path (Split-Path $PSScriptRoot -Parent) "index.html"

# Leer bytes raw
$rawBytes = [System.IO.File]::ReadAllBytes($file)

# Buscar "Poz" en los bytes raw y mostrar contexto
$searchFor = [System.Text.Encoding]::ASCII.GetBytes("Poz")
for ($i = 0; $i -lt $rawBytes.Length - 10; $i++) {
    if ($rawBytes[$i] -eq 80 -and $rawBytes[$i+1] -eq 111 -and $rawBytes[$i+2] -eq 122) {
        $sample = $rawBytes[$i..($i+20)]
        Write-Host "Bytes raw en posicion ${i}: $($sample -join ' ')"
        
        # Interpretar como Latin-1
        $latin1 = [System.Text.Encoding]::GetEncoding("iso-8859-1")
        $asLatin1 = $latin1.GetString($sample)
        Write-Host "Como Latin-1: $asLatin1"
        
        # Interpretar como UTF-8
        try {
            $utf8 = [System.Text.Encoding]::UTF8
            $asUTF8 = $utf8.GetString($sample)
            Write-Host "Como UTF-8: $asUTF8"
        } catch {
            Write-Host "Como UTF-8: ERROR - no válido"
        }
        
        Write-Host "---"
        break
    }
}
