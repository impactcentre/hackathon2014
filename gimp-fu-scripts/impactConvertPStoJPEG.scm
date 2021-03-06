; Copyright (C) 2009 IMPACT www.impact-project.eu, 
; Author Sven Schlarb <shsschlarb-impact@yahoo.de>

; impactConvertPStoJPEG
;   infile         STRING   Name of file to be loaded
;   outfile        STRING   Name of file to be saved
;   quality        FLOAT    Quality, Float within the range [0,1]
;   smoothing      FLOAT    Smooting, Float within the range [0,1]
;   optimize       INT32    Boolean integer, Optimization of entropy encoding parameters (0,1)
;   progressive    INT32    Boolean integer, Enable progressive jpeg image loading (0,1)

(define (impactConvertPStoJPEG infile outfile quality smoothing optimize progressive)
	(let* ((image (car (file-ps-load 1 infile infile)))
		(drawable (car (gimp-image-active-drawable image)))
	 )
	 
	 ; Saves files in jpeg file format
	 (file-jpeg-save 
		 1           ;   run-mode        INT32    Interactive, non-interactive
		 image       ;   image           IMAGE    Input image
		 drawable    ;   drawable        DRAWABLE Drawable to save
		 outfile     ;   filename        STRING   file name to save
		 outfile     ;   raw-filename    STRING   file name to save
		 quality     ;   quality         FLOAT    quality [0,1] - Note: Gimp only takes 
					 ;     1st position after decimal point into account (bug?). 
		 smoothing   ;   smoothing       FLOAT    smooting [0,1]
		 optimize    ;   optimize        INT32    Optimization of entropy encoding parameters (0,1)
		 progressive ;   progressive     INT32    Enable progressive jpeg image loading (0,1)
		 "GIMP"      ;   comment         STRING   Image comment
		 0           ;   subsmp          INT32    The subsampling option number
		 1           ;   baseline        INT32    Force creation of a baseline JPEG
		 0           ;   restart         INT32    Frequency of restart markers
		 0           ;   dct             INT32    DCT algorithm to us
		 )
	)
)
(script-fu-register
   "impactConvertPStoJPEG"
   "<Toolbox>/Xtns/Script-Fu/impact/impactConvertPStoJPEG"
   "impact Convert PS to JPEG" 
   "IMPACT"
   "Copyright 2009 by IMPACT"
   "2009-09-05"
   ""
   SF-FILENAME "Infile"      "infile.ps"
   SF-FILENAME "Outfile"     "outfile.jpeg"
   SF-VALUE    "Quality"     "0.1"
   SF-VALUE    "Smoothing"   "0"
   SF-VALUE    "Optimize"    "1"
   SF-VALUE    "Progressive" "1"
)

