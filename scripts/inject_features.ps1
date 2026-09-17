$ErrorActionPreference = "Stop"

$utf8 = [System.Text.Encoding]::UTF8

$garnachaFeatures = @"
          <div class="room-features" style="margin-block: 2rem; padding: 1.5rem; background: var(--paper); border-radius: var(--radius); border: 1px solid var(--stone);">
            <h3 style="margin-top: 0;">Detalles de la habitación</h3>
            <ul style="list-style: none; padding: 0; margin-bottom: 1.5rem; display: grid; gap: 0.5rem;">
              <li><strong>Tamaño:</strong> 18 m²</li>
              <li><strong>Camas:</strong> 1 cama doble y 1 litera (Camas cómodas: 8,1 según 67 comentarios)</li>
              <li><strong>Vista a:</strong> Vistas a la calle / Balcón</li>
              <li><strong>Política de humo:</strong> No se puede fumar</li>
            </ul>
            <p style="font-size: 0.9rem; font-style: italic; color: var(--muted);">The quadruple room features a private entrance, soundproof walls, a balcony with a quiet street view as well as a private bathroom boasting a shower. The unit has 2 beds.</p>
            
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--stone);">
              <div>
                <h4>En el baño privado</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Aseo</li>
                  <li>Bañera o ducha</li>
                  <li>Toallas</li>
                  <li>Papel higiénico</li>
                </ul>
              </div>
              <div>
                <h4>Servicios</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Balcón y Vistas</li>
                  <li>Insonorización y Entrada privada</li>
                  <li>Calefacción y Ventilador</li>
                  <li>Suelo de madera o parquet</li>
                  <li>Mosquitera, Armario y Perchero</li>
                  <li>Ropa de cama y Enchufe cerca de la cama</li>
                  <li>Juegos de mesa / puzles</li>
                  <li><small>Las plantas superiores solo son accesibles por escaleras</small></li>
                </ul>
              </div>
            </div>
          </div>
          <a class="button button--primary" href="contacto.html"
"@

$syrahFeatures = @"
          <div class="room-features" style="margin-block: 2rem; padding: 1.5rem; background: var(--paper); border-radius: var(--radius); border: 1px solid var(--stone);">
            <h3 style="margin-top: 0;">Detalles de la habitación</h3>
            <ul style="list-style: none; padding: 0; margin-bottom: 1.5rem; display: grid; gap: 0.5rem;">
              <li><strong>Tamaño:</strong> 17 m²</li>
              <li><strong>Camas:</strong> 2 camas grandes (Camas cómodas: 8,1 según 67 comentarios)</li>
              <li><strong>Vista a:</strong> Vistas / Balcón</li>
              <li><strong>Política de humo:</strong> No se puede fumar</li>
            </ul>
            <p style="font-size: 0.9rem; font-style: italic; color: var(--muted);">The quadruple room provides a private entrance, soundproof walls, a balcony with a quiet street view as well as a private bathroom featuring a shower.</p>
            
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--stone);">
              <div>
                <h4>En el baño privado</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Aseo</li>
                  <li>Bañera o ducha</li>
                  <li>Toallas</li>
                  <li>Papel higiénico</li>
                </ul>
              </div>
              <div>
                <h4>Servicios</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Balcón y Vistas</li>
                  <li>Insonorización y Entrada privada</li>
                  <li>Calefacción y Ventilador</li>
                  <li>Suelo de madera o parquet</li>
                  <li>Mosquitera, Sofá cama y Perchero</li>
                  <li>Ropa de cama y Enchufe cerca de la cama</li>
                  <li>Juegos de mesa / puzles</li>
                  <li><small>Las plantas superiores solo son accesibles por escaleras</small></li>
                </ul>
              </div>
            </div>
          </div>
          <a class="button button--primary" href="contacto.html"
"@

$merlotFeatures = @"
          <div class="room-features" style="margin-block: 2rem; padding: 1.5rem; background: var(--paper); border-radius: var(--radius); border: 1px solid var(--stone);">
            <h3 style="margin-top: 0;">Detalles de la habitación</h3>
            <ul style="list-style: none; padding: 0; margin-bottom: 1.5rem; display: grid; gap: 0.5rem;">
              <li><strong>Tamaño:</strong> 15 m²</li>
              <li><strong>Camas:</strong> 1 cama doble (Camas cómodas: 8,1 según 67 comentarios)</li>
              <li><strong>Vista a:</strong> Vistas / Balcón</li>
              <li><strong>Política de humo:</strong> No se puede fumar</li>
            </ul>
            <p style="font-size: 0.9rem; font-style: italic; color: var(--muted);">The double room provides a private entrance, soundproof walls, a balcony with a quiet street view as well as a private bathroom featuring a shower. The unit offers 1 bed.</p>
            
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--stone);">
              <div>
                <h4>En el baño privado</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Aseo</li>
                  <li>Bañera o ducha</li>
                  <li>Toallas</li>
                  <li>Papel higiénico</li>
                </ul>
              </div>
              <div>
                <h4>Servicios</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Balcón y Vistas</li>
                  <li>Insonorización y Entrada privada</li>
                  <li>Calefacción y Ventilador</li>
                  <li>Suelo de madera o parquet</li>
                  <li>Mosquitera y Perchero</li>
                  <li>Ropa de cama y Enchufe cerca de la cama</li>
                  <li>Juegos de mesa / puzles</li>
                  <li><small>Las plantas superiores solo son accesibles por escaleras</small></li>
                </ul>
              </div>
            </div>
          </div>
          <a class="button button--primary" href="contacto.html"
"@

$alcanonFeatures = @"
          <div class="room-features" style="margin-block: 2rem; padding: 1.5rem; background: var(--paper); border-radius: var(--radius); border: 1px solid var(--stone);">
            <h3 style="margin-top: 0;">Detalles de la habitación</h3>
            <ul style="list-style: none; padding: 0; margin-bottom: 1.5rem; display: grid; gap: 0.5rem;">
              <li><strong>Tamaño:</strong> 15 m²</li>
              <li><strong>Camas:</strong> 1 cama doble (Camas cómodas: 8,1 según 67 comentarios)</li>
              <li><strong>Vista a:</strong> Vistas a un patio interior / Patio</li>
              <li><strong>Política de humo:</strong> No se puede fumar</li>
            </ul>
            <p style="font-size: 0.9rem; font-style: italic; color: var(--muted);">Esta habitación doble cuenta con aire acondicionado, baño privado, entrada privada, paredes insonorizadas y patio. Incluye 1 cama.</p>
            
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1.5rem; margin-top: 1.5rem; padding-top: 1.5rem; border-top: 1px solid var(--stone);">
              <div>
                <h4>En el baño privado</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Aseo</li>
                  <li>Bañera o ducha</li>
                  <li>Toallas</li>
                  <li>Papel higiénico</li>
                </ul>
              </div>
              <div>
                <h4>Servicios</h4>
                <ul style="padding-left: 1.2rem; font-size: 0.95rem;">
                  <li>Aire acondicionado y Patio</li>
                  <li>Insonorización y Entrada privada</li>
                  <li>Calefacción y Ventilador</li>
                  <li>Suelo de madera o parquet</li>
                  <li>Mosquitera y Perchero</li>
                  <li>Ropa de cama y Enchufe cerca de la cama</li>
                  <li>Juegos de mesa / puzles</li>
                  <li><small>Las plantas superiores solo son accesibles por escaleras</small></li>
                </ul>
              </div>
            </div>
          </div>
          <a class="button button--primary" href="contacto.html"
"@

function InjectFeatures($filePath, $featuresHtml) {
    $content = [System.IO.File]::ReadAllText($filePath, $utf8)
    
    # We replace the exact button string so we inject the features immediately before it
    $pattern = '          <a class="button button--primary" href="contacto\.html"'
    if ($content -match $pattern) {
        $content = $content -replace $pattern, $featuresHtml
        [System.IO.File]::WriteAllText($filePath, $content, $utf8)
        Write-Host "Injected features into $filePath"
    } else {
        Write-Host "Target button not found in $filePath"
    }
}

InjectFeatures -filePath "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-garnacha.html" -featuresHtml $garnachaFeatures
InjectFeatures -filePath "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-syrah.html" -featuresHtml $syrahFeatures
InjectFeatures -filePath "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-merlot.html" -featuresHtml $merlotFeatures
InjectFeatures -filePath "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-alcanon.html" -featuresHtml $alcanonFeatures

