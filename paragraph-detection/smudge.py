#! /usr/bin/python

import sys
from PIL import Image
import argparse

parser = argparse.ArgumentParser(description='Reads a binarized image and outputs a smudged image that hopefuly helps identifying the paragraphs on it.')
parser.add_argument("-i", "--input", type=str, help='Binarized image. Works with PIL supported formats.', dest="input")
parser.add_argument("-o", "--output", type=str, help='Output image. Works with PIL supported formats.', dest="output")
parser.add_argument("-k", "--iteration", type=int, help="Number of iterations. Bigger values will result in more smudged outputs", default=4, dest="iterations")
parser.add_argument("-m", "--mode", type=str, help="Mode of the image [bn|rgba]", default="bn", dest="mode")

args = parser.parse_args()

matrix = []
secMatrix = []

realImage = Image.open(args.input)

if args.mode == "bn":
	for (r) in list(realImage.getdata()):
		matrix.append(r)
		secMatrix.append(r)
if args.mode == "rgba":
	for (r,g,b,a) in list(realImage.getdata()):
		matrix.append(r)
		secMatrix.append(r)		

(xSize,ySize) = realImage.size

for a in xrange(0,args.iterations):
	for i in xrange(0, ySize):
		for j in xrange(0, xSize):
			if matrix[(i)*xSize+j] > 128:
				continue
			for ii in {-1,1}:
				if (i + ii > ySize or i + ii < 0):
					continue
				k = 1
				while (i + ii*k < ySize and i + ii*k >= 0 and matrix[(i+ii*k)*xSize+j] > 0):
					k+=1
				if (i + ii*k < ySize and i + ii*k >= 0):
					value = 256
					for kk in xrange(1, k+1):
						value /= 2
						secMatrix[(i+ii*kk)*xSize+j] -= value
				
			for jj in {-1,1}:
				if (j + jj > xSize or j + jj < 0):
					continue
				k = 1
				while (j + jj*k < xSize and j + jj*k >= 0 and matrix[(i)*xSize+j+jj*k] > 0):
					k+=1
				if (j + jj*k < xSize and j + jj*k >= 0):
					value = 256
					for kk in xrange(1, k+1):
						value /= 2
						secMatrix[(i)*xSize+j+jj*kk] -= value	
	for i in xrange(0, len(secMatrix)):
		matrix[i] = secMatrix[i]
				

if args.mode == "bn":
	for i in xrange(0,ySize):
		for j in xrange(0,xSize):
			c = matrix[i*xSize+j]
			pixel = c
			realImage.putpixel((j,i),pixel)
			
if args.mode == "rgba":
	for i in xrange(0,ySize):
		for j in xrange(0,xSize):
			c = matrix[i*xSize+j]
			pixel = (c,c,c,255)
			realImage.putpixel((j,i),pixel)
		

realImage.save(args.output)
