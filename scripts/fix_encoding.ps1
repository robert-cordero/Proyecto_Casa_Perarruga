$files = @(
    "habitacion-garnacha.html",
    "habitacion-syrah.html",
    "habitacion-merlot.html",
    "habitacion-alcanon.html"
)

$replacements = @{
    "mÂ²" = "m²"
    "Â·" = "·"
    "sofÃ¡" = "sofá"
    "CaracterÃ­sticas" = "Características"
    "habitaciÃ³n" = "habitación"
    "InformaciÃ³n" = "Información"
    "balcÃ³n" = "balcón"
    "ValoraciÃ³n" = "Valoración"
    "segÃºn" = "según"
    "PolÃ­tica" = "Política"
    "BaÃ±o" = "Baño"
    "SÃ­" = "Sí"
    "baÃ±era" = "bañera"
    "higiÃ©nico" = "higiénico"
    "InsonorizaciÃ³n" = "Insonorización"
    "CalefacciÃ³n" = "Calefacción"
}

$utf8 = [System.Text.Encoding]::UTF8

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file, $utf8)
    
    foreach ($key in $replacements.Keys) {
        $content = $content.Replace($key, $replacements[$key])
    }

    # Remove the Valoración camas row
    $content = $content -replace "(?i)\s*<tr>\s*<td>Valoración camas</td>\s*<td>.*?</td>\s*</tr>", ""
    
    [System.IO.File]::WriteAllText($file, $content, $utf8)
    Write-Host "Fixed $file"
}
