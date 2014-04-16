; Copyright (C) 2009 IMPACT www.impact-project.eu, 
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactConvertEPStoPS   
;   infile       STRING    Name of file to be loaded
;   outfile      STRING    Name of file to be saved
;   width        FLOAT     Default: 0, Width of the image in Postscript file (0: Use input image size)
;   height       FLOAT     Default: 0, Height of the image in Postscript file (0: Use input image size)
;   x-offset     FLOAT     Default: 0, x-offset of the image in Postscript file (0: Use input image size)
;   y-offset     FLOAT     Default: 0, y-offset of the image in Postscript file (0: Use input image size)
;   unit         INT32     Default: 0, Unit for width/height/offset (0: inches, 1: millimeter)
;   keep-ratio   INT32     Default: 1, 0: Use width/height, 1: keep aspect ratio
;   rotation     INT32     Default: 0, 0, 90, 180, 270
;   eps-flag     INT32     Default: 0, 0: PostScript, 1: Encapsulated PostScript
;   preview      INT32     Default: 0, 0: No preview, >0 max. size of preview
;   level        INT32     Default: 2, 1: PostScript Level 1, 2: PostScript Level 2
		 
(define (impactConvertEPStoPS infile outfile width height x-offset y-offset unit 
                                keep-ratio rotation preview level)
	(let* ((image (car (file-eps-load 1 infile infile)))
	  (drawable (car (gimp-image-active-drawable image)))
	 )
	 ; file-ps-save (Saves files in ps file format)
	 (file-ps-save
		 1            ;   run-mode     INT32     Interactive, non-interactive
		 image        ;   image        IMAGE     Input image
		 drawable     ;   drawable     DRAWABLE  Drawable to save
		 outfile      ;   filename     STRING    file name to save
		 outfile      ;   raw-filename STRING    file name to save
		 width        ;   width        FLOAT     Width of the image in Postscript file (0: Use input image size)
		 height       ;   height       FLOAT     Height of the image in Postscript file (0: Use input image size)
		 x-offset     ;   x-offset     FLOAT     x-offset of the image in Postscript file (0: Use input image size)
		 y-offset     ;   y-offset     FLOAT     y-offset of the image in Postscript file (0: Use input image size)
		 unit         ;   unit         INT32     Unit for width/height/offset (0: inches, 1: millimeter)
		 keep-ratio   ;   keep-ratio   INT32     0: Use width/height, 1: keep aspect ratio
		 rotation     ;   rotation     INT32     0, 90, 180, 270
		 0            ;   eps-flag     INT32     0: PostScript, 1: Encapsulated PostScript | Difference PS/PS!!
		 preview      ;   preview      INT32     0: No preview, >0 max. size of preview
		 level        ;   level        INT32     1: PostScript Level 1, 2: PostScript Level 2
		 )
	)
)

(script-fu-register
   "impactConvertEPStoPS"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertEPStoPS" 
   "impact Convert EPS to PS"
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"      "infile.eps"
   SF-FILENAME "Outfile"     "outfile.ps"
   SF-VALUE    "Width"       "0"
   SF-VALUE    "Height"      "0"
   SF-VALUE    "X-offset"    "0"
   SF-VALUE    "Y-offset"    "0"
   SF-VALUE    "unit"        "0"
   SF-VALUE    "keep-ratio"  "1"
   SF-VALUE    "rotation"    "0"
   SF-VALUE    "preview"     "0"
   SF-VALUE    "level"       "2"
)