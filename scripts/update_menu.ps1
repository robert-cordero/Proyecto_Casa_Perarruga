$utf8 = [System.Text.Encoding]::UTF8
$files = Get-ChildItem -Filter *.html

$find = '                  <a href="la-casa.html#entorno-casa">Explora el Entorno</a>
                </li>'
$replace = '                  <a href="la-casa.html#entorno-casa">Explora el Entorno</a>
                </li>
                <li>
                  <a href="la-casa.html#about-us-title">Sobre Nosotros</a>
                </li>'

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, $utf8)
    if ($content -match 'la-casa\.html#about-us-title') {
        # Already has it
        continue
    }
    
    # We replace using string replacement, but since line endings might differ, regex is safer
    # We look for the exact anchor tag and its closing li
    $pattern = '(?s)<a href="la-casa\.html#entorno-casa">Explora el Entorno</a>\s*</li>'
    
    $replacement = '<a href="la-casa.html#entorno-casa">Explora el Entorno</a>
                </li>
                <li>
                  <a href="la-casa.html#about-us-title">Sobre Nosotros</a>
                </li>'
    
    $content = $content -replace $pattern, $replacement
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
    Write-Host "Updated $($file.Name)"
}
