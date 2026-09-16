# Contexto del Proyecto: Rediseño de Web - Casa Perarruga

Esta guía (skills file) proporciona a la Inteligencia Artificial (Copilot, Cursor, Cline, Roo, etc.) todo el contexto de negocio, diseño y requerimientos técnicos para asistir en el desarrollo de la nueva web de **Casa Perarruga**.

## 1. Información del Negocio y Dominio
- **Nombre:** Casa Perarruga
- **Tipo de Negocio:** Casa de pueblo / Vivienda de turismo rural (datada a finales del siglo XIX, totalmente reformada en 2016).
- **Ubicación:** Calle Barbastro, 35 – Pozán de Vero (Huesca), cerca de la Sierra de Guara y la ruta del vino del Somontano.
- **Contacto Principal:** Mireia Garcia.
- **Público Objetivo:** Turistas rurales, enoturistas, familias y parejas buscando tranquilidad, confort y naturaleza.

## 2. Estructura de Contenidos (Arquitectura de la Información)
La web debe replicar y mejorar la siguiente estructura:
- **Inicio (Home):** Hero section inspirador, resumen de la casa, reviews destacadas, y call-to-action directo a reservar/contacto.
- **La Casa:** 
  - *Planta Baja:* Patio de entrada / Recepción.
  - *Primera Planta:* 1 habitación cuádruple, cocina-comedor equipada (uso libre para huéspedes), terraza exterior.
  - *Segunda Planta:* 2 habitaciones dobles y 1 habitación cuádruple.
- **Las Habitaciones:** Nomenclatura basada en variedades de uva: **Garnacha, Merlot, Alcañón, Syrah**. Todas cuentan con baño privado.
- **Servicios:** Desayuno (estilo buffet continental incluido en tarifas), venta de productos locales, asesoramiento de actividades en la zona (Sierra de Guara, Somontano).
- **Tarifas y Reservas:** Integración clara de precios.
- **Contacto y Localización:** Mapa, teléfono, email, enlaces a RRSS (Instagram, Facebook).

## 3. Directrices de Diseño y Experiencia de Usuario (UX)
Cuando la IA genere estilos (CSS, Tailwind, etc.) o estructure componentes, debe seguir estas directrices:
- **Estilo Visual:** Rústico contemporáneo. Cálido, limpio, luminoso y acogedor.
- **Paleta de Colores (Sugerida):** 
  - Fondos: Blancos rotos o tonos crema/piedra claros para dar amplitud.
  - Acentos primarios: Tonos tierra, arcilla o colores vino (burdeos/garnacha) en honor a las habitaciones y el entorno.
  - Acentos secundarios: Verdes tenues (naturaleza, olivos).
- **Tipografía:** 
  - *Encabezados (Headings):* Tipografía Serif clásica y elegante para transmitir tradición e historia.
  - *Cuerpo (Body):* Sans-serif limpia y moderna para máxima legibilidad.
- **Imágenes (Media):** Priorizar grandes fotografías del entorno, la casa y el desayuno. Asegurar implementación de *lazy loading* y *aspect-ratios* consistentes en galerías.

## 4. Requerimientos Técnicos y Reglas de Código (AI Skills)
- **Mobile-First Responsiveness:** El diseño DEBE verse perfecto en dispositivos móviles, ya que gran parte del turismo reserva a través del smartphone. Usar layouts fluidos (Flexbox/Grid).
- **Semántica HTML y SEO:** 
  - Usar siempre etiquetas HTML5 (`<header>`, `<main>`, `<section>`, `<article>`, `<footer>`).
  - Incluir metadatos para SEO Local (*Casa rural en Pozán de Vero, Turismo Somontano, Alojamiento Sierra de Guara*).
- **Accesibilidad (a11y):** 
  - Todas las imágenes deben llevar atributo `alt` descriptivo.
  - Mantener ratios de contraste WCAG altos.
  - Enlaces y botones deben ser navegables por teclado e incluir estilos `:focus`.
- **Componentización:** Si se usa un framework moderno (React, Vue, Astro, Svelte), dividir UI en componentes pequeños (ej. `RoomCard`, `ReviewCarousel`, `ContactForm`, `Hero`).
- **Optimización de Rendimiento:** Código limpio, sin dependencias innecesarias, uso de formatos de imagen de nueva generación (WebP/AVIF).

## 5. Tono de Comunicación (Copywriting)
Cuando la IA genere textos de relleno o copys sugeridos:
- El tono debe ser **cercano, familiar, amable y respetuoso**.
- Palabras clave recurrentes: *tranquilidad, encanto, como en casa, Somontano, descanso, naturaleza*.
- Resaltar siempre los puntos fuertes según las reseñas de clientes: *limpieza impecable, el trato amable de Mireia, el delicioso desayuno y la posibilidad de usar la cocina/patio libremente.*
