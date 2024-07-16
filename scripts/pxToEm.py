#!/usr/bin/python

import re
import sys

def px_to_em(match):
    px_value = float(match.group(1))
    em_value = px_value / 16  # Assuming 1em = 16px
    if em_value == 0:
        return "0"
    else:
        return str(em_value) + "em"

def convert_px_to_em(file_contents):
    return re.sub(r'(\d*\.?\d+)px', px_to_em, file_contents)

files = sys.stdin.readlines()

for file_path in files:
    try:
        with open(file_path.strip(), 'r') as f:
            content = f.read()
        converted_content = convert_px_to_em(content)
        with open(file_path.strip(), 'w') as f:
            f.write(converted_content)
        print(f"Successfully converted px values to em in {file_path.strip()}")
    except Exception as e:
        print(f"Error processing file {file_path.strip()}: {str(e)}")
