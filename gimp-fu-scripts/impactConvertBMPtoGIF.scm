; Copyright (C) 2009 IMPACT www.impact-project.eu, 
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactConvertBMPtoGIF
; infile        STRING   Infile string name, e.g. "infile.bmp"
; outfile       STRING   Infile string name, e.g. "infile.gif"
; interlace     INT32    Boolean integer  Save as interlaced (0: No, 1: Yes)
; dither        INT32    Default: 1, Integer switch, Dither type { NO-DITHER (0), FS-DITHER (1), FSBLOWBLEED-DITHER (2), FIXED-DITHER (3)}
; palette       INT32    Default: 0, Integer switch, Palette type { MAKE-PALETTE (0), WEB-PALETTE (2), MONO-PALETTE (3), CUSTOM-PALETTE (4)}
; num-colors    INT32    Default: 256, The number of colors to quantize to
; alpha-dither  INT32    Default: 0, Dither transparency to fake partial opacity, Boolean integer, 0: No, 1: Yes
; remove-unused INT32    Default: 0, Remove unused or duplicate color entries from final palette, Boolean integer, 0: No, 1: Yes

(define (impactConvertBMPtoGIF infile outfile interlace dither palette num-colors alpha-dither remove-unused)
	(let* ((image (car (file-bmp-load 1 infile infile)))
		(drawable (car (gimp-image-active-drawable image)))
		
	 )
	
	 ; flatten image if it has an alpha channel
	 (if (gimp-drawable-has-alpha drawable)
		(set! drawable (car (gimp-image-flatten image)))
     )
	 
	 (if (= (car (gimp-drawable-type drawable)) INDEXED-IMAGE)
		(gimp-convert-rgb image)
	 )
	
	(gimp-convert-indexed 
		 image        ;  image         IMAGE    The image    
		 dither       ;  dither-type   INT32    Dither type { NO-DITHER (0), FS-DITHER (1), FSBLOWBLEED-DITHER (2), FIXED-DITHER (3)}
		 palette      ;  palette-type  INT32    Palette type { MAKE-PALETTE (0), WEB-PALETTE (2), MONO-PALETTE (3), CUSTOM-PALETTE (4)}
		 num-colors   ;  num-cols      INT32    Default: 256, The number of colors to quantize to
		 FALSE        ;  alpha-dither  INT32    Default: 0, Dither transparency to fake partial opacity, Boolean integer, 0: No, 1: Yes
		 FALSE        ;  remove-unused INT32    Default: 0, Remove unused or duplicate color entries from final palette, Boolean integer, 0: No, 1: Yes
		 ""           ;  palette       STRING   The name of the custom palette to use, ignored unless (palette_type == GIMP_CUSTOM_PALETTE)
	)
	 
	 
	 
	 ; Saves files in gif file format
	 (file-gif-save 
		 1           ;   run-mode        INT32    Interactive, non-interactive
		 image       ;   image           IMAGE    Input image
		 drawable    ;   drawable        DRAWABLE Drawable to save
		 outfile     ;   filename        STRING   file name to save
		 outfile     ;   raw-filename    STRING   file name to save
		 interlace   ;   interlace       INT32    Save as interlaced, boolean 0/1
		 0           ;   loop            INT32    (Animated gif) loop infinitely
		 0           ;   default-delay   INT32    (Animated gif) Default delay between frames in milliseconds
		 0           ;   default-dispose INT32    (Animated gif) Default disposal type (0: Don't care, 1: Combine, 2: Replace)
		 )
	)
)
(script-fu-register
   "impactConvertBMPtoGIF"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertBMPtoGIF"
   "impact Convert BMP to GIF" 
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2008-12-01"
   ""
   SF-FILENAME "Infile"      "infile.bmp"
   SF-FILENAME "Outfile"     "outfile.gif"
   SF-VALUE    "Interlaced"     "1"
   SF-VALUE    "dither"        "1"    
   SF-VALUE    "palette"       "0"    
   SF-VALUE    "num-colors"    "256"    
   SF-VALUE    "alpha-dither"  "0"    
   SF-VALUE    "remove-unused" "0"    
)

