; Copyright (C) 2009 IMPACT www.impact-project.eu,
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactConvertTIFFtoTIFF
;   infile        STRING   Name of file to be loaded
;   outfile       STRING   Name of file to be saved
;   num-colors    INT32    Default: 256, The number of colors to quantize to
;   compression   INT32    Switch integer, Compression type: {None (0), LZW (1), PACKBITS(2), DEFLATE (3), JPEG (4), CCITT G3 Fax (5), CCITT G4 Fax (6)}

(define (impactConvertTIFFtoTIFF infile outfile num-colors compression)
	(let* ((image (car (file-tiff-load 1 infile infile)))
	  (drawable (car (gimp-image-active-drawable image)))
	 )

	 ; flatten image if it has an alpha channel
	 (if (gimp-drawable-has-alpha drawable)
		(set! drawable (car (gimp-image-flatten image)))
     )

	 ; only convert to indexed if the original image is not already an indexed image
	 (if not(gimp-drawable-is-indexed drawable)
		(gimp-convert-indexed
			 image        ;  image         IMAGE    The image
			 0       ;  dither-type   INT32    Dither type { NO-DITHER (0), FS-DITHER (1), FSBLOWBLEED-DITHER (2), FIXED-DITHER (3)}
			 0      ;  palette-type  INT32    Palette type { MAKE-PALETTE (0), WEB-PALETTE (2), MONO-PALETTE (3), CUSTOM-PALETTE (4)}
			 num-colors   ;  num-cols      INT32    Default: 256, The number of colors to quantize to
			 FALSE        ;  alpha-dither  INT32    Default: 0, Dither transparency to fake partial opacity, Boolean integer, 0: No, 1: Yes
			 TRUE         ;  remove-unused INT32    Default: 0, Remove unused or duplicate color entries from final palette, Boolean integer, 0: No, 1: Yes
			 ""           ;  palette       STRING   The name of the custom palette to use, ignored unless (palette_type == GIMP_CUSTOM_PALETTE)
		)
     )

	 ; file-tiff-save (Saves files in tiff file format)
	 (file-tiff-save
		 1            ;   run-mode     INT32     Interactive, non-interactive
		 image        ;   image        IMAGE     Input image
		 drawable     ;   drawable     DRAWABLE  Drawable to save
		 outfile      ;   filename     STRING    file name to save
		 outfile      ;   raw-filename STRING    file name to save
		 compression  ;   compression  INT32     Compression type: {None (0), LZW (1), PACKBITS(2), DEFLATE (3), JPEG (4), CCITT G3 Fax (5), CCITT G4 Fax (6)}
		 )
	)
)

(script-fu-register
   "impactConvertTIFFtoTIFF"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertTIFFtoTIFF"
   "impact Convert TIFF to TIFF"
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"        "infile.tiff"
   SF-FILENAME "Outfile"       "outfile.tiff"
   SF-VALUE    "num-colors"    "256"
   SF-VALUE    "compression"    "0"
)
