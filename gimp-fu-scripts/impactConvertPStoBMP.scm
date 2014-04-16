; Copyright (C) 2009 IMPACT www.impact-project.eu, 
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactConvertPStoBMP
;   infile         STRING   Name of file to be loaded
;   outfile        STRING   Name of file to be saved

(define (impactConvertPStoBMP infile outfile)
	(let* ((image (car (file-ps-load 1 infile infile)))
		(drawable (car (gimp-image-active-drawable image)))
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
   "impactConvertPStoBMP"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertPStoBMP"
   "impact Convert PS to BMP" 
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"      "infile.ps"
   SF-FILENAME "Outfile"     "outfile.bmp"
)

