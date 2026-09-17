import os
import glob

booking_btn_str_lacasa = '''          <a
            class="button button--booking"
            href="https://www.booking.com/hotel/es/casa-perarruga.es.html?label=casa-perarruga-aPDXB5siTOXOJWH2P6ihbQS466324829192%3Apl%3Ata%3Ap1%3Ap2%3Aac%3Aap%3Aneg%3Afi%3Atikwd-368432872474%3Alp9197910%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YcGt_tphEo8pawEozW2KQ80&amp;sid=4bc61bdd47e0f33b08dd6b1c204d0a0e&amp;gclid=CjwKCAjw_KjVBhAHEiwAnC0N9K6-22BFaxeWyyTwNk_1AvTN_GtbEFXbpusUPiJRdxfGMWek1PBj7BoCmowQAvD_BwE&amp;aid=311090&amp;ucfs=1&amp;arphpl=1&amp;dest_id=-397373&amp;dest_type=city&amp;group_adults=2&amp;req_adults=2&amp;no_rooms=1&amp;group_children=0&amp;req_children=0&amp;hpos=1&amp;hapos=1&amp;sr_order=popularity&amp;srpvid=c06a6f31c897105a&amp;srepoch=1789573737&amp;from=searchresults"
            target="_blank"
            rel="noopener noreferrer"
            ><svg
              class="button__icon"
              viewBox="0 0 24 24"
              aria-hidden="true"
              focusable="false"
            >
              <rect x="3" y="4.5" width="18" height="16" rx="2" />
              <path d="M8 2.5v4M16 2.5v4M3 9h18M8 14l2 2 5-5" />
            </svg>
            <span>Reservar en Booking</span></a
          >
'''

# 1. Remove from la-casa.html
with open('la-casa.html', 'r', encoding='utf-8') as f:
    content = f.read()

if booking_btn_str_lacasa in content:
    content = content.replace(booking_btn_str_lacasa, '')
    print('Replaced booking button in la-casa.html')
else:
    print('Could not find exact booking button string in la-casa.html')
    # Try just finding the block by a simpler regex
    import re
    new_content = re.sub(r'\s*<a[^>]*class="button button--booking"[^>]*href="https://www.booking.com[^>]*>[\s\S]*?<span>Reservar en Booking</span></a>\s*', '\n', content)
    if new_content != content:
        content = new_content
        print('Replaced booking button in la-casa.html via regex')

with open('la-casa.html', 'w', encoding='utf-8') as f:
    f.write(content)

# 2. Add to all header navs
old_header = '''            <li><a class="nav-cta" href="contacto.html">Contacto</a></li>
          </ul>
        </nav>'''

new_header = '''            <li><a class="nav-cta" href="contacto.html">Contacto</a></li>
            <li>
              <a
                class="button button--booking nav-booking"
                href="https://www.booking.com/hotel/es/casa-perarruga.es.html"
                target="_blank"
                rel="noopener noreferrer"
                style="padding: 0.5rem 1rem; min-height: auto; margin-left: 1rem; display: inline-flex; align-items: center; gap: 0.5rem; background: #002f78; color: white; border-radius: var(--radius); text-decoration: none;"
              >
                <svg
                  class="button__icon"
                  viewBox="0 0 24 24"
                  aria-hidden="true"
                  focusable="false"
                  style="width: 1.2rem; height: 1.2rem; fill: none; stroke: currentColor; stroke-width: 2;"
                >
                  <rect x="3" y="4.5" width="18" height="16" rx="2" />
                  <path d="M8 2.5v4M16 2.5v4M3 9h18M8 14l2 2 5-5" />
                </svg>
                <span>Reservar</span>
              </a>
            </li>
          </ul>
        </nav>'''

html_files = glob.glob('*.html')
for html_file in html_files:
    with open(html_file, 'r', encoding='utf-8') as f:
        file_content = f.read()
    
    if old_header in file_content:
        file_content = file_content.replace(old_header, new_header)
        with open(html_file, 'w', encoding='utf-8') as f:
            f.write(file_content)
        print(f'Updated header in {html_file}')
    else:
        print(f'Header target not found in {html_file}')

