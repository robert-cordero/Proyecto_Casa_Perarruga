$utf8 = [System.Text.Encoding]::UTF8
$content = [System.IO.File]::ReadAllText("index.html", $utf8)

$section = @"
      <section class="about-us page-width section" aria-labelledby="about-us-title">
        <div class="about-us__inner">
          <div class="about-us__content">
            <p class="eyebrow eyebrow--wine">NUESTRA HISTORIA</p>
            <h2 id="about-us-title">Sobre Nosotros</h2>
            <p>
              Somos Mireia y Jordi, una pareja de Barcelona que solíamos venir a menudo por la Sierra de Guara atraídos por la belleza de sus parajes y por la cantidad de actividades de aventura que en ella se pueden realizar.
            </p>
            <blockquote class="about-us__quote">
              «Dejar el estrés de la ciudad para construir nuestro sueño rural.»
            </blockquote>
            <p>
              Durante nuestras estancias en la zona, nos sentíamos tan a gusto y en paz que cansados del estrés de la ciudad y la rutina de nuestras vidas, decidimos probar suerte y venir a vivir aquí. Compramos Casa Perarruga, una casa grande y con muchas posibilidades y empezamos a construir poco a poco nuestro sueño de abrir un pequeño hotel rural y formar aquí nuestra familia, dónde hoy por fin ya es una realidad.
            </p>
          </div>
          <div class="about-us__image-container">
            <img src="imgs/sobre-nosotros.jpg" alt="Mireia y Jordi en Casa Perarruga" loading="lazy" class="about-us__image" />
          </div>
        </div>
      </section>
    </main>
"@

$content = $content -replace '\s*</main>', "`n$section"
[System.IO.File]::WriteAllText("index.html", $content, $utf8)
Write-Host "Updated index.html"
