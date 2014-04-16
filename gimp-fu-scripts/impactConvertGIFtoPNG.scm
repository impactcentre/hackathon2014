; Copyright (C) 2009 IMPACT www.impact-project.eu, 
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactConvertGIFtoPNG
;   infile        STRING   Name of file to be loaded
;   outfile       STRING   Name of file to be saved
;   interlace     INT32    Boolean integer, (0: No interlace, 1: Interlace)
;   compression   INT32    Range integer, Compression Min. 0 to max. 9

(define (impactConvertGIFtoPNG infile outfile interlace compression)
	(let* ((image (car (file-gif-load 1 infile infile)))
	  (drawable (car (gimp-image-active-drawable image)))
	 )
	 
	 ; convert to rgb
	 (gimp-image-convert-rgb image)
	 
	 ; file-png-save (Saves files in png file format)
	 (file-png-save
		 1            ;   run-mode     INT32     Interactive, non-interactive
		 image        ;   image        IMAGE     Input image
		 drawable     ;   drawable     DRAWABLE  Drawable to save
		 outfile      ;   filename     STRING    file name to save
		 outfile      ;   raw-filename STRING    file name to save
		 interlace    ;   interlace    INT32     Ue Adam7 interlacing?
		 compression  ;   compression  INT32     Deflate compression factor (0--9)
		 1            ;   bkgd         INT32     Write bKGD chunk
		 1            ;   gama         INT32     Write gAMA chunk
		 1            ;   offs         INT32     Write oFFs chunk
		 1            ;   phys         INT32     Write pHYs chunk
		 1            ;   time         INT32     Write tIME chunk
		 )
	)
)

(script-fu-register
   "impactConvertGIFtoPNG"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertGIFtoPNG" 
   "impact Convert GIF to PNG"
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"      "infile.gif"
   SF-FILENAME "Outfile"     "outfile.png"
   SF-VALUE    "Interlace"   "1"
   SF-VALUE    "Interlace"   "1"
   SF-VALUE    "Compression" "1"
)
