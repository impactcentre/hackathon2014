; Copyright (C) 2009 IMPACT www.impact-project.eu, 
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactConvertTIFFtoBMP
;   infile         STRING   Name of file to be loaded
;   outfile        STRING   Name of file to be saved

(define (impactConvertTIFFtoBMP infile outfile)
	(let* ((image (car (file-tiff-load 1 infile infile)))
		(drawable (car (gimp-image-active-drawable image)))
	 )
	 	 
	 ; flatten image if it has an alpha channel
	 (if (gimp-drawable-has-alpha drawable)
		(set! drawable (car (gimp-image-flatten image)))
     )
	 
	 ; Saves files in bmp file format
	 (file-bmp-save 
		 1           ;   run-mode        INT32    Interactive, non-interactive
		 image       ;   image           IMAGE    Input image
		 drawable    ;   drawable        DRAWABLE Drawable to save
		 outfile     ;   filename        STRING   file name to save
		 outfile     ;   raw-filename    STRING   file name to save
		 )
	)
)
(script-fu-register
   "impactConvertTIFFtoBMP"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertTIFFtoBMP"
   "impact Convert TIFF to BMP" 
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"      "infile.tiff"
   SF-FILENAME "Outfile"     "outfile.bmp"
)

