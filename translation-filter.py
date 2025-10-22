#!/usr/bin/env python
"""
Pandoc-filtrilo por konverti :::translation blokojn al ruby HTML.
"""

import re
from pandocfilters import toJSONFilter, RawBlock, stringify

def translation_filter(key, value, format, meta):
    """
    La ĉefa filtrila funkcio.
    """
    if key == 'Div':
        [[_ident, classes, _kvs], content] = value
        if 'translation' in classes:
            if format in ('html', 'html5'):
                text = stringify(content)
                lines = text.strip().split('\n')
                
                # Forigi malplenajn liniojn, kiuj povus aperi
                lines = [line for line in lines if line.strip()]

                if not lines:
                    return None

                chinese_line = lines[0].strip()
                english_line = ""
                if len(lines) > 1:
                    english_line = lines[1].strip()

                # Trakti ĉinan linion en <ruby> etikedojn
                parts = re.findall(r'([^()\s]+?)\s*\(([^)]+)\)', chinese_line)
                
                ruby_html_parts = []
                for kanji, romaji in parts:
                    # Norma <ruby> strukturo
                    ruby_html_parts.append(f'<ruby><rb>{kanji}</rb><rt>{romaji}</rt></ruby>')
                
                chinese_html_content = '\n    '.join(ruby_html_parts)
                
                english_html_content = ""
                if english_line.startswith('|'):
                    english_text = english_line[1:].strip()
                    english_html_content = f'\n    <div class="translation">{english_text}</div>'

                full_html = f'<div class="dharani-row">\n    {chinese_html_content}{english_html_content}\n</div>'

                return RawBlock('html', full_html)
    return None

if __name__ == "__main__":
    toJSONFilter(translation_filter)
