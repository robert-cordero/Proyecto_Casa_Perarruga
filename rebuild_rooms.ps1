$ErrorActionPreference = "Stop"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# ─── GARNACHA ────────────────────────────────────────────────────────────────
$garnachaMain = @'
    <main>
      <section
        class="page-hero page-width room-detail-hero room-detail-hero--garnacha"
      >
        <p class="eyebrow">Las habitaciones · 01</p>
        <h1>Habitación Garnacha</h1>
        <p>
          Habitación cuádruple, ideal para familias con niños. Con cama de
          matrimonio, litera, baño privado y un pequeño balcón con vistas a
          la calle.
        </p>
      </section>
      <section
        class="room-detail page-width"
        aria-labelledby="room-description-title"
      >
        <div class="room-gallery">
          <img
            src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?q=80&w=1200&auto=format&fit=crop"
            alt="Habitación Garnacha con cama doble y decoración cálida"
          /><img
            src="https://images.unsplash.com/photo-1586023492125-27b2c045efd7?q=80&w=800&auto=format&fit=crop"
            alt="Detalle de mobiliario y decoración de la habitación Garnacha"
            loading="lazy"
          /><img
            src="https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?q=80&w=800&auto=format&fit=crop"
            alt="Rincón luminoso de la habitación Garnacha"
            loading="lazy"
          />
        </div>
        <div class="room-description">
          <p class="eyebrow">Un refugio para compartir</p>
          <h2 id="room-description-title">
            Un espacio pensado para las familias
          </h2>
          <p>
            La distribución de Garnacha combina descanso y funcionalidad para
            que las familias puedan disfrutar de unos días cómodos en Casa
            Perarruga.
          </p>
          <p>
            Su pequeño balcón aporta un rincón agradable para asomarse a la
            calle. El desayuno de estilo continental está incluido en todas
            las tarifas.
          </p>
          <a class="button button--primary" href="contacto.html"
            >Reservar ahora <span aria-hidden="true">↗</span></a
          >
        </div>
      </section>
      <section
        class="room-photo-carousel page-width"
        aria-label="Galería de la habitación Garnacha"
      >
        <button
          class="room-photo-carousel__control room-photo-carousel__control--previous"
          type="button"
          aria-label="Imagen anterior"
        >
          ‹
        </button>
        <div class="room-photo-carousel__track">
          <img
            src="imgs/Habitaciones/Garnacha/Garnacha.jpg"
            alt="Habitación Garnacha"
          />
          <img
            src="imgs/Habitaciones/Garnacha/image00014.jpeg"
            alt="Interior de la habitación Garnacha"
            loading="lazy"
          />
          <img
            src="imgs/Habitaciones/Garnacha/image00015-768x1024.jpeg"
            alt="Detalle de la habitación Garnacha"
            loading="lazy"
          />
        </div>
        <button
          class="room-photo-carousel__control room-photo-carousel__control--next"
          type="button"
          aria-label="Imagen siguiente"
        >
          ›
        </button>
      </section>
      <section class="room-amenities page-width" aria-label="Características de la habitación Garnacha">
        <h3 class="room-amenities__title">Características de la habitación</h3>
        <ul class="room-amenities__meta">
          <li><strong>18 m²</strong></li>
          <li><strong>Capacidad:</strong> hasta 4 personas</li>
          <li><strong>Camas:</strong> 1 cama doble · 1 litera</li>
          <li><strong>Vista:</strong> Calle y balcón</li>
          <li><strong>Valoración camas:</strong> 8,1 según 67 opiniones</li>
          <li>🚭 No se puede fumar</li>
        </ul>
        <div class="room-amenities__sections">
          <div class="room-amenities__section">
            <h4>Baño privado</h4>
            <ul class="room-amenities__chips">
              <li>Aseo</li>
              <li>Bañera o ducha</li>
              <li>Toallas</li>
              <li>Papel higiénico</li>
            </ul>
          </div>
          <div class="room-amenities__section">
            <h4>Habitación</h4>
            <ul class="room-amenities__chips">
              <li>Balcón</li>
              <li>Vistas a la calle</li>
              <li>Insonorización</li>
              <li>Entrada privada</li>
              <li>Calefacción</li>
              <li>Ventilador</li>
              <li>Suelo de madera o parquet</li>
              <li>Mosquitera</li>
              <li>Armario</li>
              <li>Perchero</li>
              <li>Ropa de cama</li>
              <li>Enchufe cerca de la cama</li>
              <li>Juegos de mesa / puzles</li>
            </ul>
          </div>
        </div>
        <p class="room-amenities__note">Las plantas superiores solo son accesibles por escaleras.</p>
      </section>
    </main>
'@

# ─── SYRAH ───────────────────────────────────────────────────────────────────
$syrahMain = @'
    <main>
      <section
        class="page-hero page-width room-detail-hero room-detail-hero--syrah"
      >
        <p class="eyebrow">Las habitaciones · 04</p>
        <h1>Habitación<br />Syrah</h1>
        <p>
          Habitación para dos o cuatro personas, muy amplia, con dos camas
          grandes, sofá cama de matrimonio, baño privado y balcón con vistas
          a la calle.
        </p>
      </section>
      <section
        class="room-detail page-width"
        aria-labelledby="room-description-title"
      >
        <div class="room-gallery">
          <img
            src="https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=1200&auto=format&fit=crop"
            alt="Habitación Syrah con detalles de madera"
          /><img
            src="https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?q=80&w=800&auto=format&fit=crop"
            alt="Detalle de la habitación Syrah"
            loading="lazy"
          /><img
            src="https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?q=80&w=800&auto=format&fit=crop"
            alt="Rincón acogedor de la habitación Syrah"
            loading="lazy"
          />
        </div>
        <div class="room-description">
          <p class="eyebrow">Amplitud para disfrutar</p>
          <h2 id="room-description-title">Flexibilidad para descansar</h2>
          <p>
            Syrah ofrece una distribución amplia y versátil, ideal tanto para
            una escapada en pareja como para compartir unos días con familia o
            amigos.
          </p>
          <p>
            El balcón con vistas a la calle amplía la sensación de espacio. El
            desayuno de estilo continental está incluido en todas las tarifas.
          </p>
          <a class="button button--primary" href="contacto.html"
            >Reservar ahora <span aria-hidden="true">↗</span></a
          >
        </div>
      </section>
      <section
        class="room-photo-carousel page-width"
        aria-label="Galería de la habitación Syrah"
      >
        <button
          class="room-photo-carousel__control room-photo-carousel__control--previous"
          type="button"
          aria-label="Imagen anterior"
        >
          ‹
        </button>
        <div class="room-photo-carousel__track">
          <img src="imgs/Habitaciones/Syrah/Syrah.jpg" alt="Habitación Syrah" />
          <img
            src="imgs/Habitaciones/Syrah/Syrah_Relleno (2).jpg"
            alt="Interior de la habitación Syrah"
            loading="lazy"
          />
          <img
            src="imgs/Habitaciones/Syrah/Syrah_Relleno.jpg"
            alt="Detalle de la habitación Syrah"
            loading="lazy"
          />
        </div>
        <button
          class="room-photo-carousel__control room-photo-carousel__control--next"
          type="button"
          aria-label="Imagen siguiente"
        >
          ›
        </button>
      </section>
      <section class="room-amenities page-width" aria-label="Características de la habitación Syrah">
        <h3 class="room-amenities__title">Características de la habitación</h3>
        <ul class="room-amenities__meta">
          <li><strong>17 m²</strong></li>
          <li><strong>Capacidad:</strong> hasta 4 personas</li>
          <li><strong>Camas:</strong> 2 camas grandes · sofá cama</li>
          <li><strong>Vista:</strong> Calle y balcón</li>
          <li><strong>Valoración camas:</strong> 8,1 según 67 opiniones</li>
          <li>🚭 No se puede fumar</li>
        </ul>
        <div class="room-amenities__sections">
          <div class="room-amenities__section">
            <h4>Baño privado</h4>
            <ul class="room-amenities__chips">
              <li>Aseo</li>
              <li>Bañera o ducha</li>
              <li>Toallas</li>
              <li>Papel higiénico</li>
            </ul>
          </div>
          <div class="room-amenities__section">
            <h4>Habitación</h4>
            <ul class="room-amenities__chips">
              <li>Balcón</li>
              <li>Vistas a la calle</li>
              <li>Insonorización</li>
              <li>Entrada privada</li>
              <li>Sofá cama</li>
              <li>Calefacción</li>
              <li>Ventilador</li>
              <li>Suelo de madera o parquet</li>
              <li>Mosquitera</li>
              <li>Perchero</li>
              <li>Ropa de cama</li>
              <li>Enchufe cerca de la cama</li>
              <li>Juegos de mesa / puzles</li>
            </ul>
          </div>
        </div>
        <p class="room-amenities__note">Las plantas superiores solo son accesibles por escaleras.</p>
      </section>
    </main>
'@

# ─── MERLOT ──────────────────────────────────────────────────────────────────
$merlotMain = @'
    <main>
      <section
        class="page-hero page-width room-detail-hero room-detail-hero--merlot"
      >
        <p class="eyebrow">Las habitaciones · 02</p>
        <h1>Habitación Merlot</h1>
        <p>
          Habitación doble con cama de matrimonio, baño privado y balcón con
          vistas a la calle.
        </p>
      </section>
      <section
        class="room-detail page-width"
        aria-labelledby="room-description-title"
      >
        <div class="room-gallery">
          <img
            src="https://images.unsplash.com/photo-1590490360182-c33d57733427?q=80&w=1200&auto=format&fit=crop"
            alt="Habitación Merlot con textiles naturales"
          /><img
            src="https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?q=80&w=800&auto=format&fit=crop"
            alt="Detalle de la habitación Merlot"
            loading="lazy"
          /><img
            src="https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?q=80&w=800&auto=format&fit=crop"
            alt="Rincón luminoso de la habitación Merlot"
            loading="lazy"
          />
        </div>
        <div class="room-description">
          <p class="eyebrow">Tranquilidad en el Somontano</p>
          <h2 id="room-description-title">Serenidad para dos</h2>
          <p>
            Merlot invita a bajar el ritmo después de un día descubriendo los
            paisajes y bodegas del Somontano. Sus textiles y tonos cálidos crean
            una atmósfera serena y acogedora.
          </p>
          <p>
            El balcón con vistas a la calle añade luz y conexión con la vida del
            pueblo. El desayuno de estilo continental está incluido en todas
            las tarifas.
          </p>
          <a class="button button--primary" href="contacto.html"
            >Reservar ahora <span aria-hidden="true">↗</span></a
          >
        </div>
      </section>
      <section
        class="room-photo-carousel page-width"
        aria-label="Galería de la habitación Merlot"
      >
        <button
          class="room-photo-carousel__control room-photo-carousel__control--previous"
          type="button"
          aria-label="Imagen anterior"
        >
          ‹
        </button>
        <div class="room-photo-carousel__track">
          <img
            src="imgs/Habitaciones/Merlot/Merlot.jpg"
            alt="Habitación Merlot"
          />
          <img
            src="imgs/Habitaciones/Merlot/Perarruga-1-habitacion-2a-planta.jpeg"
            alt="Interior de la habitación Merlot"
            loading="lazy"
          />
        </div>
        <button
          class="room-photo-carousel__control room-photo-carousel__control--next"
          type="button"
          aria-label="Imagen siguiente"
        >
          ›
        </button>
      </section>
      <section class="room-amenities page-width" aria-label="Características de la habitación Merlot">
        <h3 class="room-amenities__title">Características de la habitación</h3>
        <ul class="room-amenities__meta">
          <li><strong>15 m²</strong></li>
          <li><strong>Capacidad:</strong> 2 personas</li>
          <li><strong>Camas:</strong> 1 cama doble</li>
          <li><strong>Vista:</strong> Calle y balcón</li>
          <li><strong>Valoración camas:</strong> 8,1 según 67 opiniones</li>
          <li>🚭 No se puede fumar</li>
        </ul>
        <div class="room-amenities__sections">
          <div class="room-amenities__section">
            <h4>Baño privado</h4>
            <ul class="room-amenities__chips">
              <li>Aseo</li>
              <li>Bañera o ducha</li>
              <li>Toallas</li>
              <li>Papel higiénico</li>
            </ul>
          </div>
          <div class="room-amenities__section">
            <h4>Habitación</h4>
            <ul class="room-amenities__chips">
              <li>Balcón</li>
              <li>Vistas a la calle</li>
              <li>Insonorización</li>
              <li>Entrada privada</li>
              <li>Calefacción</li>
              <li>Ventilador</li>
              <li>Suelo de madera o parquet</li>
              <li>Mosquitera</li>
              <li>Perchero</li>
              <li>Ropa de cama</li>
              <li>Enchufe cerca de la cama</li>
              <li>Juegos de mesa / puzles</li>
            </ul>
          </div>
        </div>
        <p class="room-amenities__note">Las plantas superiores solo son accesibles por escaleras.</p>
      </section>
    </main>
'@

# ─── ALCAÑÓN ─────────────────────────────────────────────────────────────────
$alcanonMain = @'
    <main>
      <section
        class="page-hero page-width room-detail-hero room-detail-hero--alcanon"
      >
        <p class="eyebrow">Las habitaciones · 03</p>
        <h1>Habitación Alcañón</h1>
        <p>
          Habitación doble, la más pequeña de la casa pero muy acogedora. Con
          cama de matrimonio, aire acondicionado, baño privado y ventana al
          patio interior.
        </p>
      </section>
      <section
        class="room-detail page-width"
        aria-labelledby="room-description-title"
      >
        <div class="room-gallery">
          <img
            src="https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?q=80&w=1200&auto=format&fit=crop"
            alt="Habitación Alcañón, íntima y acogedora"
          /><img
            src="https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=800&auto=format&fit=crop"
            alt="Detalle de la habitación Alcañón"
            loading="lazy"
          /><img
            src="https://images.unsplash.com/photo-1600607688969-a5bfcd646154?q=80&w=800&auto=format&fit=crop"
            alt="Espacio luminoso de la habitación Alcañón"
            loading="lazy"
          />
        </div>
        <div class="room-description">
          <p class="eyebrow">Intimidad y calma</p>
          <h2 id="room-description-title">Pequeña, íntima y acogedora</h2>
          <p>
            Alcañón aprovecha cada rincón para ofrecer una estancia confortable
            y tranquila. Es una opción perfecta para quienes buscan un espacio
            íntimo donde descansar.
          </p>
          <p>
            La ventana orientada al patio transmite la calma de la casa y su
            carácter tradicional. El desayuno de estilo continental está
            incluido en todas las tarifas.
          </p>
          <a class="button button--primary" href="contacto.html"
            >Reservar ahora <span aria-hidden="true">↗</span></a
          >
        </div>
      </section>
      <section
        class="room-photo-carousel page-width"
        aria-label="Galería de la habitación Alcañón"
      >
        <button
          class="room-photo-carousel__control room-photo-carousel__control--previous"
          type="button"
          aria-label="Imagen anterior"
        >
          ‹
        </button>
        <div class="room-photo-carousel__track">
          <img
            src="imgs/Habitaciones/Alcañon/Alcañon.jpg"
            alt="Habitación Alcañón"
          />
          <img
            src="imgs/Habitaciones/Alcañon/image00008-768x576.jpeg"
            alt="Interior de la habitación Alcañón"
            loading="lazy"
          />
        </div>
        <button
          class="room-photo-carousel__control room-photo-carousel__control--next"
          type="button"
          aria-label="Imagen siguiente"
        >
          ›
        </button>
      </section>
      <section class="room-amenities page-width" aria-label="Características de la habitación Alcañón">
        <h3 class="room-amenities__title">Características de la habitación</h3>
        <ul class="room-amenities__meta">
          <li><strong>15 m²</strong></li>
          <li><strong>Capacidad:</strong> 2 personas</li>
          <li><strong>Camas:</strong> 1 cama doble</li>
          <li><strong>Vista:</strong> Patio interior</li>
          <li><strong>Valoración camas:</strong> 8,1 según 67 opiniones</li>
          <li>🚭 No se puede fumar</li>
        </ul>
        <div class="room-amenities__sections">
          <div class="room-amenities__section">
            <h4>Baño privado</h4>
            <ul class="room-amenities__chips">
              <li>Aseo</li>
              <li>Bañera o ducha</li>
              <li>Toallas</li>
              <li>Papel higiénico</li>
            </ul>
          </div>
          <div class="room-amenities__section">
            <h4>Habitación</h4>
            <ul class="room-amenities__chips">
              <li>Aire acondicionado</li>
              <li>Patio interior</li>
              <li>Insonorización</li>
              <li>Entrada privada</li>
              <li>Calefacción</li>
              <li>Ventilador</li>
              <li>Suelo de madera o parquet</li>
              <li>Mosquitera</li>
              <li>Perchero</li>
              <li>Ropa de cama</li>
              <li>Enchufe cerca de la cama</li>
              <li>Juegos de mesa / puzles</li>
            </ul>
          </div>
        </div>
        <p class="room-amenities__note">Las plantas superiores solo son accesibles por escaleras.</p>
      </section>
    </main>
'@

# ─── Shared: booking nav, footer ─────────────────────────────────────────────
$bookingNavItem = @'
            <li>
              <a class="nav-cta nav-cta--booking" href="https://www.booking.com/hotel/es/casa-perarruga.es.html?label=casa-perarruga-aPDXB5siTOXOJWH2P6ihbQS466324829192%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-368432872474%3Alp9197910%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YcGt_tphEo8pawEozW2KQ80&amp;sid=4bc61bdd47e0f33b08dd6b1c204d0a0e&amp;gclid=CjwKCAjw_KjVBhAHEiwAnC0N9K6-22BFaxeWyyTwNk_1AvTN_GtbEFXbpusUPiJRdxfGMWek1PBj7BoCmowQAvD_BwE&amp;aid=311090&amp;ucfs=1&amp;arphpl=1&amp;dest_id=-397373&amp;dest_type=city&amp;group_adults=2&amp;req_adults=2&amp;no_rooms=1&amp;group_children=0&amp;req_children=0&amp;hpos=1&amp;hapos=1&amp;sr_order=popularity&amp;srpvid=c06a6f31c897105a&amp;srepoch=1789573737&amp;from=searchresults" target="_blank" rel="noopener noreferrer">Reservar</a>
            </li>
'@

function RebuildRoomPage($filePath, $newMain, $currentPageLabel) {
    $original = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
    
    # Extract header up to </header>
    $headerEnd = $original.IndexOf('</header>')
    $header = $original.Substring(0, $headerEnd + 9)  # include </header>
    
    # Extract footer from <footer ... to end
    $footerStart = $original.IndexOf('<footer class="site-footer">')
    $footerAndEnd = $original.Substring($footerStart)
    
    # Add booking button to nav if not already there
    if ($header -notmatch 'nav-cta--booking') {
        $header = $header -replace '(?s)(<li><a class="nav-cta" href="contacto\.html"[^>]*>Contacto</a[^>]*>\s*</li>\s*</ul>\s*</nav>)', "<li><a class=`"nav-cta`" href=`"contacto.html`">Contacto</a></li>`n$bookingNavItem          </ul>`n        </nav>"
    }
    
    $script = [System.IO.File]::ReadAllText($filePath.Replace('.html', '.html'), [System.Text.Encoding]::UTF8)
    
    $newContent = $header + "`r`n" + $newMain + "`r`n    <script src=`"room-carousel.js`"></script>`r`n    <" + "footer class=`"site-footer`">" + $footerAndEnd.Substring('<footer class="site-footer">'.Length)
    
    [System.IO.File]::WriteAllText($filePath, $newContent, $utf8NoBom)
    Write-Host "Rebuilt: $filePath"
}

RebuildRoomPage "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-garnacha.html" $garnachaMain "garnacha"
RebuildRoomPage "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-syrah.html" $syrahMain "syrah"
RebuildRoomPage "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-merlot.html" $merlotMain "merlot"
RebuildRoomPage "c:\1.PROYECTOS\Proyecto_Casa_Perarruga\habitacion-alcanon.html" $alcanonMain "alcanon"

Write-Host "Done."
