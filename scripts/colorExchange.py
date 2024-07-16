#!/usr/bin/python

import os
from PIL import Image

if os.path.basename(os.getcwd()).lower() == "light":
    OLD_COLOR = 0x5A
    NEW_COLOR = 0x18
else:
    OLD_COLOR = 0xCC
    NEW_COLOR = 0xDD

OLD_PIXEL = (OLD_COLOR,) * 3

def colorExchange(image_path, output_path):
    img = Image.open(image_path)
    img = img.convert('RGBA')
    pixel_data = img.getdata()
    new_pixel_data = []
    remap = False
    for pixel in pixel_data:
        if pixel[:3] == OLD_PIXEL:
            remap = True
            new_pixel_data.append((NEW_COLOR, NEW_COLOR, NEW_COLOR, pixel[3]))
        else:
            new_pixel_data.append(pixel)

    if remap:
        img.putdata(new_pixel_data)
        img.save(output_path)
    else:
        print("no themed pixels", image_path)

input_dir = "."
output_dir = "."
for filename in os.listdir(input_dir):
    if filename.endswith(".png") or filename.endswith(".jpg"):
        input_path = os.path.join(input_dir, filename)
        output_path = os.path.join(output_dir, filename)

        # Change color of the image and save the modified image
        colorExchange(input_path, output_path)
