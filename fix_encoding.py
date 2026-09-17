import os

files = [
    "habitacion-garnacha.html",
    "habitacion-syrah.html",
    "habitacion-merlot.html",
    "habitacion-alcanon.html"
]

replacements = {
    "mÂ²": "m²",
    "Â·": "·",
    "sofÃ¡": "sofá",
    "CaracterÃ­sticas": "Características",
    "habitaciÃ³n": "habitación",
    "InformaciÃ³n": "Información",
    "balcÃ³n": "balcón",
    "ValoraciÃ³n": "Valoración",
    "segÃºn": "según",
    "PolÃ­tica": "Política",
    "BaÃ±o": "Baño",
    "SÃ­": "Sí",
    "baÃ±era": "bañera",
    "higiÃ©nico": "higiénico",
    "InsonorizaciÃ³n": "Insonorización",
    "CalefacciÃ³n": "Calefacción"
}

for f in files:
    with open(f, 'r', encoding='utf-8') as file:
        content = file.read()
    
    for k, v in replacements.items():
        content = content.replace(k, v)
    
    lines = content.split('\n')
    new_lines = []
    for line in lines:
        if 'Valoración camas' not in line:
            new_lines.append(line)
            
    with open(f, 'w', encoding='utf-8') as file:
        file.write('\n'.join(new_lines))
    print(f"Fixed {f}")
