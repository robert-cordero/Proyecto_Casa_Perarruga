$ErrorActionPreference = "Stop"

$files = Get-ChildItem -Filter *.html
$utf8 = [System.Text.Encoding]::UTF8

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, $utf8)
    
    $pattern = '<a class="nav-cta" href="https://www.booking.com/hotel/es/casa-perarruga.es.html'
    $replacement = '<a class="nav-cta nav-cta--booking" href="https://www.booking.com/hotel/es/casa-perarruga.es.html'
    
    if ($content -match [regex]::Escape($pattern)) {
        $content = $content -replace [regex]::Escape($pattern), $replacement
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
        Write-Host "Updated $($file.Name)"
    } else {
        Write-Host "Pattern not found in $($file.Name)"
    }
}
