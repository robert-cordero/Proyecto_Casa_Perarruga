$utf8 = [System.Text.Encoding]::UTF8

# Common amenities card template builder
function MakeCardSection($file, $svgInfo, $infoRows, $bathroomRows, $amenityRows, $note) {
    $content = [System.IO.File]::ReadAllText($file, $utf8)

    $cardBlock = @"

      <section class="room-amenities page-width" aria-label="Características de la habitación">
        <h3 class="room-amenities__title">Características de la habitación</h3>
        <div class="room-amenities__cards">
          <!-- Información general -->
          <div class="room-amenities__card">
            <div class="room-amenities__card-header">
              <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
              Información general
            </div>
            <table class="room-amenities__table">
              <tbody>
$infoRows
              </tbody>
            </table>
          </div>
          <!-- Baño privado -->
          <div class="room-amenities__card">
            <div class="room-amenities__card-header">
              <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M9 6 C9 3.8 10.8 2 13 2 s4 1.8 4 4 v8 H2 v-2 a4 4 0 0 1 4-4 h3 Z"/><rect x="2" y="14" width="20" height="4" rx="1"/><line x1="6" y1="18" x2="6" y2="22"/><line x1="18" y1="18" x2="18" y2="22"/></svg>
              Baño privado
            </div>
            <table class="room-amenities__table">
              <tbody>
$bathroomRows
              </tbody>
            </table>
          </div>
          <!-- Comodidades -->
          <div class="room-amenities__card">
            <div class="room-amenities__card-header">
              <svg viewBox="0 0 24 24" aria-hidden="true"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/><line x1="12" y1="12" x2="12" y2="16"/><line x1="10" y1="14" x2="14" y2="14"/></svg>
              Comodidades
            </div>
            <table class="room-amenities__table">
              <tbody>
$amenityRows
              </tbody>
            </table>
          </div>
        </div>
        <p class="room-amenities__note">$note</p>
      </section>
    </main>
"@

    # Remove old chips-based section and replace </main>
    $oldPattern = '(?s)<section class="room-amenities page-width"[^>]*>.*?</section>\s*</main>'
    $content = [regex]::Replace($content, $oldPattern, $cardBlock.TrimStart())
    [System.IO.File]::WriteAllText($file, $content, $utf8)
    Write-Host "Updated $file"
}

# Syrah
$syrahInfo = "                <tr><td>Superficie</td><td>17 m²</td></tr>`n                <tr><td>Capacidad</td><td>Hasta 4 personas</td></tr>`n                <tr><td>Camas</td><td>2 camas grandes · sofá cama</td></tr>`n                <tr><td>Vistas</td><td>Calle y balcón</td></tr>`n                <tr><td>Valoración camas</td><td>8,1 según 67 opiniones</td></tr>`n                <tr><td>Política de humo</td><td>No se puede fumar</td></tr>"
$syrahBath = "                <tr><td>Aseo</td><td>Sí</td></tr>`n                <tr><td>Ducha o bañera</td><td>Sí</td></tr>`n                <tr><td>Toallas</td><td>Incluidas</td></tr>`n                <tr><td>Papel higiénico</td><td>Incluido</td></tr>"
$syrahAmen = "                <tr><td>Balcón</td><td>Sí</td></tr>`n                <tr><td>Sofá cama</td><td>Sí</td></tr>`n                <tr><td>Insonorización</td><td>Sí</td></tr>`n                <tr><td>Entrada privada</td><td>Sí</td></tr>`n                <tr><td>Calefacción</td><td>Sí</td></tr>`n                <tr><td>Ventilador</td><td>Sí</td></tr>`n                <tr><td>Suelo</td><td>Madera o parquet</td></tr>`n                <tr><td>Mosquitera</td><td>Sí</td></tr>`n                <tr><td>Perchero</td><td>Sí</td></tr>`n                <tr><td>Ropa de cama</td><td>Incluida</td></tr>`n                <tr><td>Enchufe</td><td>Cerca de la cama</td></tr>`n                <tr><td>Entretenimiento</td><td>Juegos de mesa / puzles</td></tr>"
MakeCardSection "habitacion-syrah.html" "" $syrahInfo $syrahBath $syrahAmen "Las plantas superiores solo son accesibles por escaleras."

# Merlot
$merlotInfo = "                <tr><td>Superficie</td><td>15 m²</td></tr>`n                <tr><td>Capacidad</td><td>2 personas</td></tr>`n                <tr><td>Camas</td><td>1 cama doble</td></tr>`n                <tr><td>Vistas</td><td>Calle y balcón</td></tr>`n                <tr><td>Valoración camas</td><td>8,1 según 67 opiniones</td></tr>`n                <tr><td>Política de humo</td><td>No se puede fumar</td></tr>"
$merlotBath = "                <tr><td>Aseo</td><td>Sí</td></tr>`n                <tr><td>Ducha o bañera</td><td>Sí</td></tr>`n                <tr><td>Toallas</td><td>Incluidas</td></tr>`n                <tr><td>Papel higiénico</td><td>Incluido</td></tr>"
$merlotAmen = "                <tr><td>Balcón</td><td>Sí</td></tr>`n                <tr><td>Insonorización</td><td>Sí</td></tr>`n                <tr><td>Entrada privada</td><td>Sí</td></tr>`n                <tr><td>Calefacción</td><td>Sí</td></tr>`n                <tr><td>Ventilador</td><td>Sí</td></tr>`n                <tr><td>Suelo</td><td>Madera o parquet</td></tr>`n                <tr><td>Mosquitera</td><td>Sí</td></tr>`n                <tr><td>Perchero</td><td>Sí</td></tr>`n                <tr><td>Ropa de cama</td><td>Incluida</td></tr>`n                <tr><td>Enchufe</td><td>Cerca de la cama</td></tr>`n                <tr><td>Entretenimiento</td><td>Juegos de mesa / puzles</td></tr>"
MakeCardSection "habitacion-merlot.html" "" $merlotInfo $merlotBath $merlotAmen "Las plantas superiores solo son accesibles por escaleras."

# Alcañón
$alcanonInfo = "                <tr><td>Superficie</td><td>15 m²</td></tr>`n                <tr><td>Capacidad</td><td>2 personas</td></tr>`n                <tr><td>Camas</td><td>1 cama doble</td></tr>`n                <tr><td>Vistas</td><td>Patio interior</td></tr>`n                <tr><td>Valoración camas</td><td>8,1 según 67 opiniones</td></tr>`n                <tr><td>Política de humo</td><td>No se puede fumar</td></tr>"
$alcanonBath = "                <tr><td>Aseo</td><td>Sí</td></tr>`n                <tr><td>Ducha o bañera</td><td>Sí</td></tr>`n                <tr><td>Toallas</td><td>Incluidas</td></tr>`n                <tr><td>Papel higiénico</td><td>Incluido</td></tr>"
$alcanonAmen = "                <tr><td>Aire acondicionado</td><td>Sí</td></tr>`n                <tr><td>Patio interior</td><td>Sí</td></tr>`n                <tr><td>Insonorización</td><td>Sí</td></tr>`n                <tr><td>Entrada privada</td><td>Sí</td></tr>`n                <tr><td>Calefacción</td><td>Sí</td></tr>`n                <tr><td>Ventilador</td><td>Sí</td></tr>`n                <tr><td>Suelo</td><td>Madera o parquet</td></tr>`n                <tr><td>Mosquitera</td><td>Sí</td></tr>`n                <tr><td>Perchero</td><td>Sí</td></tr>`n                <tr><td>Ropa de cama</td><td>Incluida</td></tr>`n                <tr><td>Enchufe</td><td>Cerca de la cama</td></tr>`n                <tr><td>Entretenimiento</td><td>Juegos de mesa / puzles</td></tr>"
MakeCardSection "habitacion-alcanon.html" "" $alcanonInfo $alcanonBath $alcanonAmen "Las plantas superiores solo son accesibles por escaleras."

Write-Host "All done."
