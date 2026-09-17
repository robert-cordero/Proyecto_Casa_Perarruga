$utf8 = [System.Text.Encoding]::UTF8

$files = @{
    "habitacion-garnacha.html" = "https://www.booking.com/hotel/es/casa-perarruga.es.html?label=casa-perarruga-aPDXB5siTOXOJWH2P6ihbQS466324829192%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-368432872474%3Alp9197910%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YcGt_tphEo8pawEozW2KQ80&sid=4bc61bdd47e0f33b08dd6b1c204d0a0e&gclid=CjwKCAjw_KjVBhAHEiwAnC0N9K6-22BFaxeWyyTwNk_1AvTN_GtbEFXbpusUPiJRdxfGMWek1PBj7BoCmowQAvD_BwE&aid=311090&ucfs=1&arphpl=1&dest_id=-397373&dest_type=city&group_adults=2&req_adults=2&no_rooms=1&group_children=0&req_children=0&hpos=1&hapos=1&sr_order=popularity&srpvid=c06a6f31c897105a&srepoch=1789573737&from=searchresults#RD247701401"
    "habitacion-syrah.html" = "https://www.booking.com/hotel/es/casa-perarruga.es.html?label=casa-perarruga-aPDXB5siTOXOJWH2P6ihbQS466324829192%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-368432872474%3Alp9197910%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YcGt_tphEo8pawEozW2KQ80&sid=4bc61bdd47e0f33b08dd6b1c204d0a0e&gclid=CjwKCAjw_KjVBhAHEiwAnC0N9K6-22BFaxeWyyTwNk_1AvTN_GtbEFXbpusUPiJRdxfGMWek1PBj7BoCmowQAvD_BwE&aid=311090&ucfs=1&arphpl=1&dest_id=-397373&dest_type=city&group_adults=2&req_adults=2&no_rooms=1&group_children=0&req_children=0&hpos=1&hapos=1&sr_order=popularity&srpvid=c06a6f31c897105a&srepoch=1789573737&from=searchresults#RD247701402"
    "habitacion-merlot.html" = "https://www.booking.com/hotel/es/casa-perarruga.es.html?label=casa-perarruga-aPDXB5siTOXOJWH2P6ihbQS466324829192%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-368432872474%3Alp9197910%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YcGt_tphEo8pawEozW2KQ80&sid=4bc61bdd47e0f33b08dd6b1c204d0a0e&gclid=CjwKCAjw_KjVBhAHEiwAnC0N9K6-22BFaxeWyyTwNk_1AvTN_GtbEFXbpusUPiJRdxfGMWek1PBj7BoCmowQAvD_BwE&aid=311090&ucfs=1&arphpl=1&dest_id=-397373&dest_type=city&group_adults=2&req_adults=2&no_rooms=1&group_children=0&req_children=0&hpos=1&hapos=1&sr_order=popularity&srpvid=c06a6f31c897105a&srepoch=1789573737&from=searchresults#RD247701403"
    "habitacion-alcanon.html" = "https://www.booking.com/hotel/es/casa-perarruga.es.html?label=casa-perarruga-aPDXB5siTOXOJWH2P6ihbQS466324829192%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-368432872474%3Alp9197910%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YcGt_tphEo8pawEozW2KQ80&sid=4bc61bdd47e0f33b08dd6b1c204d0a0e&gclid=CjwKCAjw_KjVBhAHEiwAnC0N9K6-22BFaxeWyyTwNk_1AvTN_GtbEFXbpusUPiJRdxfGMWek1PBj7BoCmowQAvD_BwE&aid=311090&ucfs=1&arphpl=1&dest_id=-397373&dest_type=city&group_adults=2&req_adults=2&no_rooms=1&group_children=0&req_children=0&hpos=1&hapos=1&sr_order=popularity&srpvid=c06a6f31c897105a&srepoch=1789573737&from=searchresults#RD247701404"
}

foreach ($file in $files.Keys) {
    $content = [System.IO.File]::ReadAllText($file, $utf8)
    
    # We want to replace the button class and href
    $url = $files[$file]
    # Escape ampersands for HTML to be safe
    $urlEscaped = $url.Replace("&", "&amp;")
    
    $find = '<a class="button button--primary" href="contacto.html"'
    $replace = '<a class="button button--booking" target="_blank" rel="noopener noreferrer" href="' + $urlEscaped + '"'
    
    $content = $content.Replace($find, $replace)
    
    [System.IO.File]::WriteAllText($file, $content, $utf8)
    Write-Host "Updated $file"
}
