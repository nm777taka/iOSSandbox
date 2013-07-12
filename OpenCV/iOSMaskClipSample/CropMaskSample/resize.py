#coding:utf-8

from PIL import Image
import os
import sys

try:
	filename = sys.argv[1]
except:
	filename = 'lena.jpg'

im = Image.open(filename)

try:
	export = sys.argv[2]
except:
	export = 'resized.png'

try:
	width = int(sys.argv[3])
	height = int(sys.argv[4])

except:
	width = 320
	height = 480



out = im.resize((width,height))
out.show()
out.save(export)
