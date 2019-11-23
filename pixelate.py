#!/usr/local/bin/python3
from PIL import Image, ImageEnhance
import numpy as np

# Open Paddington
img = Image.open("headshot.PNG")

contrast = ImageEnhance.Contrast(img)
img = contrast.enhance(10)
np_img = np.array(img)
avg = (np_img[:,:,0] + np_img[:,:,1] + np_img[:,:,2])/3

img = Image.fromarray(avg)

img.save('denero_enhanced.png')

# Resize smoothly down to 16x16 pixels
imgSmall = img.resize((54,80),resample=Image.BILINEAR)

# Scale back up using NEAREST to original size
result = imgSmall.resize(img.size,Image.NEAREST)

# Save
result.save('denero_pixelate.png')