#!/usr/bin/python
import xml.etree.ElementTree as ET
import subprocess
import re
import sys
import time
import html
import sys

start_time = time.time()

APP = sys.argv[1]
LANGUAGE = sys.argv[2]
FILE = f'{APP}_{LANGUAGE}.ts'
print(f'Language: {LANGUAGE}')
print(f'File:    {FILE}')

tree = ET.parse(FILE)
root = tree.getroot()

def cleanupTranslation(text, translation):
    for symbol in ['.', ':', '&', '?']:
        if translation.endswith(symbol) and not text.rstrip().endswith(symbol):
            translation = translation.rstrip(symbol)
        if text.endswith(symbol) and not translation.rstrip().endswith(symbol):
            translation = translation + symbol
        if text.startswith(symbol) and not translation.startswith(symbol):
            translation = symbol + translation

    if "% " not in text and "% " in translation:
        translation = translation.replace("% ", "%")

    leading_whitespace  = text[:len(text) - len(text.lstrip())]
    trailing_whitespace = text[len(text.rstrip()):]
    translation         = leading_whitespace + translation.strip() + trailing_whitespace
    return translation

def translate(match):
    return html.unescape(subprocess.check_output(['trans', '-b', ':' + LANGUAGE, match.group(0)]).strip().decode('utf-8'))

def getTranslatedText(text):
    return re.sub(r'\b[A-Za-z]+\b', translate, subprocess.check_output(['trans', '-b', ':' + LANGUAGE, text]).strip().decode('utf-8'))

tree.write(FILE, encoding="utf-8")

end_time = time.time()
elapsed_time = end_time - start_time
minutes = int(elapsed_time // 60)
seconds = int(elapsed_time % 60)
print(f"Translate took {minutes} min, {seconds} secs")
