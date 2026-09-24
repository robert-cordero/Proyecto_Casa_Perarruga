# Casa Perarruga - Proyecto Web

El proyecto consiste en el rediseño y desarrollo del sitio web para **Casa Perarruga**, una vivienda de turismo rural situada en la localidad de Pozán de Vero, Huesca. Se trata de una antigua casa de pueblo datada a finales del siglo XIX y totalmente reformada en 2016. El modelo de negocio y el sitio web están orientados a turistas rurales, enoturistas, familias y parejas que buscan tranquilidad y proximidad a la Sierra de Guara y la ruta del vino del Somontano.

## 🏗 Arquitectura de la Información

El sitio web está estructurado para ofrecer una navegación intuitiva y una conversión directa hacia las reservas:

* **Inicio (`index.html`)**: Página principal equipada con una sección *hero* inspiradora, un resumen de la casa, acceso a reseñas destacadas y llamadas a la acción directas para reservas y contacto.
* **La Casa (`la-casa.html`)**: Descripción de los espacios comunes distribuidos en tres plantas: patio de entrada/recepción, cocina-comedor equipada (de uso libre para los huéspedes) y terraza.
* **Las Habitaciones (`habitaciones.html`)**: Espacios de descanso con nomenclatura basada en las variedades de uva de la comarca, todas equipadas con baño privado:
* **Garnacha (`habitacion-garnacha.html`)**: Habitación cuádruple de 18 m², ideal para familias, equipada con cama doble, litera y balcón.
* **Merlot (`habitacion-merlot.html`)**: Habitación doble de 15 m² con cama de matrimonio, tonos cálidos y vistas a la calle.
* **Alcañón (`habitacion-alcanon.html`)**: Habitación doble de 15 m², íntima y acogedora, orientada hacia el patio interior.
* **Syrah (`habitacion-syrah.html`)**: Habitación versátil de 17 m² para dos o cuatro personas, con dos camas individuales y sofá cama.


* **Servicios (`servicios.html`)**: Detalle sobre servicios incluidos como el desayuno continental, acceso a internet, posibilidad de adquirir productos locales (D.O. Somontano) e información sobre actividades en la naturaleza.
* **Opiniones (`opiniones.html`)**: Panel con reseñas de huéspedes extraídas directamente de Booking.com, mostrando una puntuación general destacada.
* **Contacto (`contacto.html`)**: Información operativa, incluyendo teléfono, correo electrónico, botones directos a WhatsApp, mapa embebido de Google Maps y acceso al motor de reservas.

## 🎨 Directrices de Diseño y UX

* **Estilo Visual**: Rústico contemporáneo, cálido, limpio y luminoso.
* **Paleta de Colores**: Uso de blancos rotos, tonos crema o piedra claros para el fondo; acentos en tonos tierra o colores vino (burdeos/garnacha); y detalles secundarios en verdes tenues evocando la naturaleza.
* **Tipografía**: Se combinan fuentes Serif elegantes para los encabezados (transmitiendo historia y tradición) y fuentes Sans-serif limpias para el cuerpo, garantizando máxima legibilidad.
* **Mobile-First y Rendimiento**: Layouts fluidos mediante Flexbox/Grid para asegurar una perfecta adaptabilidad a dispositivos móviles. Componentización limpia sin dependencias innecesarias e implementación de *lazy loading* en galerías fotográficas.
* **Accesibilidad y SEO**: HTML5 100% semántico, etiquetas `alt` descriptivas en imágenes, ratios de contraste WCAG altos, interactividad navegable por teclado y meta-etiquetas de SEO local configuradas.

## ⚙️ Herramientas y Scripts de Automatización

El proyecto cuenta con un ecosistema de scripts en PowerShell y Python dentro del directorio `/scripts/` diseñados para simplificar el mantenimiento masivo del código fuente:

* **Corrección de Codificación (Mojibake)**: Scripts como `fix_mojibake.ps1`, `fix_mojibake_double.ps1` y `fix_mojibake.py` para detectar, recuperar y recodificar correctamente archivos HTML que sufrieron corrupción de caracteres (Latin-1 a UTF-8).
* **Actualización de Enlaces e Imágenes**: Utilidades como `fix_paths.ps1` y `fix_img_paths.ps1` reescriben y aseguran las rutas relativas hacia la carpeta centralizada `assets/` tras reestructuraciones del proyecto.
* **Inyección y Actualización de Contenidos**: `inject_features.ps1`, `update_amenities.ps1`, y `rebuild_rooms.ps1` permiten inyectar de forma programática las características detalladas, comodidades y bloques estructurales en las páginas de las cuatro habitaciones sin edición manual.
* **Sincronización de Reservas**: Scripts como `update_booking.ps1` y `update_booking.py` automatizan la sustitución o actualización de los enlaces transversales de Booking en el header y los CTAs del proyecto.

## 📁 Estructura de Directorios

```text
casa-perarruga/
├── index.html
├── la-casa.html
├── habitaciones.html
├── habitacion-garnacha.html
├── habitacion-merlot.html
├── habitacion-alcanon.html
├── habitacion-syrah.html
├── servicios.html
├── opiniones.html
├── contacto.html
├── assets/
│   ├── css/
│   │   └── styles.css
│   ├── js/
│   │   └── room-carousel.js
│   ├── img/
│   └── icons/
├── scripts/
│   ├── fix_mojibake.ps1
│   ├── fix_mojibake.py
│   ├── fix_paths.ps1
│   ├── inject_features.ps1
│   └── update_booking.py
└── docs/
    └── skills/
        └── casa_perarruga_ai_skills.md

```