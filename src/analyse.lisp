;;; -*- Mode: LISP; Base: 10; Syntax: ANSI-Common-lisp; Package: PROJECT -*-

;;; Analyse data

;;; Here's a few simple descriptive analysis.  These are commented out here because you would normally use them at the REPL, or as part of a chain of analysis.  If we left them here they'd print out their values when loading the system, and that could cause confusion.

;(mean mtcars:mpg)
; => 20.090625000000003d0
;(nu:sd mtcars:mpg)			;standard deviation is exported from the NU package.
; => 6.026948052089104d0		;Refer to it here with it's package prefix because we
					;didn't USE or IMPORT-FROM when we defined PROJECT.


;;; In your project, you will likely have several functions
;;; specifically for your type of analysis, some possibly built on
;;; those found in NUMERICAL-UTILITIES, or other systems.
