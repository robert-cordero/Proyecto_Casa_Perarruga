$ErrorActionPreference = "Stop"

$utf8 = [System.Text.Encoding]::UTF8

$files = @(
    "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-alcanon.html",
    "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-merlot.html"
)

$newHeaderBlock = @"
            <li><a class="nav-cta" href="contacto.html">Contacto</a></li>
            <li>
              <a class="nav-cta nav-cta--booking" href="https://www.booking.com/hotel/es/casa-perarruga.es.html?label=casa-perarruga-aPDXB5siTOXOJWH2P6ihbQS466324829192%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-368432872474%3Alp9197910%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YcGt_tphEo8pawEozW2KQ80&amp;sid=4bc61bdd47e0f33b08dd6b1c204d0a0e&amp;gclid=CjwKCAjw_KjVBhAHEiwAnC0N9K6-22BFaxeWyyTwNk_1AvTN_GtbEFXbpusUPiJRdxfGMWek1PBj7BoCmowQAvD_BwE&amp;aid=311090&amp;ucfs=1&amp;arphpl=1&amp;dest_id=-397373&amp;dest_type=city&amp;group_adults=2&amp;req_adults=2&amp;no_rooms=1&amp;group_children=0&amp;req_children=0&amp;hpos=1&amp;hapos=1&amp;sr_order=popularity&amp;srpvid=c06a6f31c897105a&amp;srepoch=1789573737&amp;from=searchresults" target="_blank" rel="noopener noreferrer">Reservar</a>
            </li>
          </ul>
        </nav>
"@

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file, $utf8)
    if ($content -notmatch 'nav-cta--booking') {
        if ($content -match '(?s)<li><a class="nav-cta" href="contacto\.html">Contacto</a></li>\s*</ul>\s*</nav>') {
            $content = $content -replace '(?s)<li><a class="nav-cta" href="contacto\.html">Contacto</a></li>\s*</ul>\s*</nav>', $newHeaderBlock
            [System.IO.File]::WriteAllText($file, $content, $utf8)
            Write-Host "Fixed header in $file"
        }
    } else {
        Write-Host "Already has booking button in $file"
    }
}
