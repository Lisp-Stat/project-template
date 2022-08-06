;;; -*- Mode: LISP; Base: 10; Syntax: ANSI-Common-lisp; Package: PROJECT -*-

#| In this file we'll create three data frames from various sources |#

;;;
;;; Load Data
;;;

;;; TSV

;;; This example reads a TSV file from a logical pathname that is
;;; defined in the ls-init.lisp file.  The logical host is "LS", the
;;; directory "DATA" and the file name "mtcars.tsv".  You should
;;; define similar hosts and directories in your project init file.
;;; See init.lisp in this directory for further commentary.

(defdf mtcars1 (read-csv #P"PROJECT:DATA;mtcars.tsv")) ;read-csv also reads TSV

;;; CSV

(defdf mtcars2 (read-csv #P"PROJECT:DATA;mtcars.csv"))

;;; JSON

;;; This example illustrates reading application specific JSON data
;;; from a network URL.  You can add your own JSON readers by following
;;; the pattern in PLOT:SRC;VEGA;data.lisp.  The code to read and
;;; write Vega JSON is less than one page.

(defdf disasters (read-csv vega:disasters))


;;;
;;; Cleaning data
;;;

;;; Data is rarely usable 'out of the box'.  Here are a few
;;; transformations on the disasters data frame to clean it up.

;;; First, let's label the variables so we have more user-friendly
;;; names.

(set-properties disasters :label '(:year  "Year of disaster"
				   :deaths "Number of deaths"))

;; This data set has a bare year value, e.g. '1900', that Vega-Lite
;; interprets as an integer.  Transform the column to an ISO-8601
;; format.
(replace-column! disasters 'year #'(lambda (x)
				     (local-time:encode-timestamp 0 0 0 0 1 1 x)))

;; Categorical variables cannot be automatically determined, so we set them here.
(set-properties disasters :type '(:year   :temporal
				  :entity :categorical))

