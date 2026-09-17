"""
fix_mojibake.py
---------------
Corrige el Mojibake en todos los .html del directorio raíz del proyecto.

Estrategia:
  Los archivos tienen bytes UTF-8 válidos pero en algún momento fueron
  leídos como Latin-1 y guardados de nuevo, produciendo secuencias como
  Ã¡ (que es á codificado en UTF-8 e interpretado como Latin-1).

  La solución es:
    1. Leer el fichero como bytes raw.
    2. Decodificar como Latin-1 (iso-8859-1) — que nunca falla, 1-to-1.
    3. Re-codificar esa cadena a bytes como latin-1.
    4. Decodificar esos bytes como UTF-8 — así recuperamos el texto correcto.
    5. Guardar en UTF-8 sin BOM.

  Si el paso 4 falla (el fichero ya estaba bien), se deja tal cual.
"""

import os
import sys
import glob

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
HTML_PATTERN = os.path.join(ROOT, "*.html")

def fix_mojibake(path: str) -> bool:
    """Devuelve True si el archivo fue modificado."""
    with open(path, "rb") as f:
        raw = f.read()

    # Intentar detectar si hay mojibake:
    # Decodificamos como latin-1 (siempre funciona) y luego re-codificamos a latin-1
    # para obtener los bytes originales, que luego decodificamos como UTF-8.
    try:
        latin_str = raw.decode("latin-1")
        # Re-codificar a latin-1 para obtener los bytes "originales" UTF-8
        recovered_bytes = latin_str.encode("latin-1")
        fixed_str = recovered_bytes.decode("utf-8")
    except (UnicodeDecodeError, UnicodeEncodeError):
        # El fichero ya está bien en UTF-8 o tiene otra codificación; no tocamos.
        print(f"  [SIN CAMBIOS - ya OK]  {os.path.basename(path)}")
        return False

    # Si el texto antes y después son iguales, no había mojibake
    try:
        original_str = raw.decode("utf-8")
    except UnicodeDecodeError:
        original_str = None  # era inválido en UTF-8

    if original_str is not None and original_str == fixed_str:
        print(f"  [SIN CAMBIOS - limpio]  {os.path.basename(path)}")
        return False

    # Guardar como UTF-8 sin BOM
    with open(path, "w", encoding="utf-8", newline="") as f:
        f.write(fixed_str)

    print(f"  [CORREGIDO]            {os.path.basename(path)}")
    return True

def main():
    files = sorted(glob.glob(HTML_PATTERN))
    if not files:
        print("No se encontraron archivos .html en:", ROOT)
        sys.exit(1)

    print(f"Procesando {len(files)} archivos HTML en: {ROOT}\n")
    corrected = 0
    for path in files:
        if fix_mojibake(path):
            corrected += 1

    print(f"\n{'='*50}")
    print(f"Archivos corregidos : {corrected}/{len(files)}")
    print(f"UTF-8 sin BOM aplicado a todos los modificados.")
    print("Proceso completado con éxito.")

if __name__ == "__main__":
    main()
