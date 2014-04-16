; impactConvertJPEGtoBMP
;   infile         STRING   Name of file to be loaded
;   outfile        STRING   Name of file to be saved

(define (impactConvertJPEGtoBMP infile outfile)
	(let* ((image (car (file-jpeg-load 1 infile infile)))
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
   "impactConvertJPEGtoBMP"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertJPEGtoBMP"
   "impact Convert JPEG to BMP" 
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"      "infile.jpeg"
   SF-FILENAME "Outfile"     "outfile.bmp"
)

