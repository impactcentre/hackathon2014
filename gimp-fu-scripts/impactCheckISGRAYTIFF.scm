; Copyright (C) 2009 IMPACT www.impact-project.eu,
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactCheckISGRAYTIFF
;   infile        STRING   Name of file to be loaded
;   outfile       STRING   Name of file to be saved
;   compression   INT32    Switch integer, Compression type: {None (0), LZW (1), PACKBITS(2), DEFLATE (3), JPEG (4), CCITT G3 Fax (5), CCITT G4 Fax (6)}

(define (impactCheckISGRAYTIFF infile)
	(let* ((image (car (file-tiff-load 1 infile infile)))
	  (drawable (car (gimp-image-active-drawable image)))
	 )
     (if (= (car (gimp-drawable-is-indexed drawable)) TRUE)
		(gimp-message "drawable is indexed")
	 )
     (if (= (car (gimp-drawable-is-gray drawable)) TRUE)
		(gimp-message "drawable is gray")
	 )
     (if (= (car (gimp-drawable-is-rgb drawable)) TRUE)
		(gimp-message "drawable is rgb")
	 )
     
     (set! palstr (car (gimp-context-get-palette))
        (gimp-message palstr)
     )
   )
)

(script-fu-register
   "impactCheckISGRAYTIFF"
   "<Toolbox>/Xtns/Script-Fu/impact/impactCheckISGRAYTIFF"
   "impact Check if the TIFF image is grayscale"
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"        "infile.gif"
)
