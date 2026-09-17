$utf8 = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText('habitacion-garnacha.html', $utf8)

$newBlock = @"

      <section class="room-amenities page-width" aria-label="Características de la habitación Garnacha">
        <h3 class="room-amenities__title">Características de la habitación</h3>
        <div class="room-amenities__cards">
          <div class="room-amenities__card">
            <div class="room-amenities__card-header">
              <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
              Información general
            </div>
            <table class="room-amenities__table">
              <tbody>
                <tr><td>Superficie</td><td>18 m²</td></tr>
                <tr><td>Capacidad</td><td>Hasta 4 personas</td></tr>
                <tr><td>Camas</td><td>1 cama doble · 1 litera</td></tr>
                <tr><td>Vistas</td><td>Calle y balcón</td></tr>
                <tr><td>Valoración camas</td><td>8,1 según 67 opiniones</td></tr>
                <tr><td>Política de humo</td><td>No se puede fumar</td></tr>
              </tbody>
            </table>
          </div>
          <div class="room-amenities__card">
            <div class="room-amenities__card-header">
              <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M9 6 C9 3.8 10.8 2 13 2 s4 1.8 4 4 v8 H2 v-2 a4 4 0 0 1 4-4 h3 Z"/><rect x="2" y="14" width="20" height="4" rx="1"/><line x1="6" y1="18" x2="6" y2="22"/><line x1="18" y1="18" x2="18" y2="22"/></svg>
              Baño privado
            </div>
            <table class="room-amenities__table">
              <tbody>
                <tr><td>Aseo</td><td>Sí</td></tr>
                <tr><td>Ducha o bañera</td><td>Sí</td></tr>
                <tr><td>Toallas</td><td>Incluidas</td></tr>
                <tr><td>Papel higiénico</td><td>Incluido</td></tr>
              </tbody>
            </table>
          </div>
          <div class="room-amenities__card">
            <div class="room-amenities__card-header">
              <svg viewBox="0 0 24 24" aria-hidden="true"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/><line x1="12" y1="12" x2="12" y2="16"/><line x1="10" y1="14" x2="14" y2="14"/></svg>
              Comodidades
            </div>
            <table class="room-amenities__table">
              <tbody>
                <tr><td>Balcón</td><td>Sí</td></tr>
                <tr><td>Insonorización</td><td>Sí</td></tr>
                <tr><td>Entrada privada</td><td>Sí</td></tr>
                <tr><td>Calefacción</td><td>Sí</td></tr>
                <tr><td>Ventilador</td><td>Sí</td></tr>
                <tr><td>Suelo</td><td>Madera o parquet</td></tr>
                <tr><td>Mosquitera</td><td>Sí</td></tr>
                <tr><td>Almacenaje</td><td>Armario y perchero</td></tr>
                <tr><td>Ropa de cama</td><td>Incluida</td></tr>
                <tr><td>Enchufe</td><td>Cerca de la cama</td></tr>
                <tr><td>Entretenimiento</td><td>Juegos de mesa / puzles</td></tr>
              </tbody>
            </table>
          </div>
        </div>
        <p class="room-amenities__note">Las plantas superiores solo son accesibles por escaleras.</p>
      </section>
    </main>

"@

$pattern = '(?s)<section class="room-amenities page-width"[^>]*>.*?</section>\s*</main>'
$newContent = [regex]::Replace($content, $pattern, $newBlock.TrimStart())
[System.IO.File]::WriteAllText('habitacion-garnacha.html', $newContent, $utf8)
Write-Host "Garnacha rebuilt."
