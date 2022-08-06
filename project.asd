;;; -*- Mode: LISP; Base: 10; Syntax: ANSI-Common-lisp; Package: ASDF -*-

;;; The system definition file (this file) can be used to generate
;;; documentation using declt (and other systems).  In order to better
;;; illustrate the potential values for the various fields, we will use the
;;; XLisp-Stat Cost of Data Analysis system as an example of a real-world system.
;;; https://github.com/Lisp-Stat/xls-archive/tree/master/statistics/regression/cda

(defsystem #:project
  :name "Project Name"	;usually the same as the ASDF system name, with proper capitalisation and spacing
  :version     "1.0.0"
  :license     :Apache-2.0		;choose your license and use the identifier from https://spdx.org/
  :author      "John Doe <john@foo.com>"
  :long-name   "The cost of data analysis" ;short phrase
  :description "Data analytic actions as functions acting on regression models"
  :long-description  #.(uiop:read-file-string ;multi-paragraph description of purpose of system
			(uiop:subpathname *load-pathname* "description.text"))
  :homepage    "https://project.website" ;if any
  :source-control (:git "https://github.com/name/repo.git")
  :bug-tracker "https://github.com/name/repo/issues"

  ;; This dependency list should cover most statistical projects
  :depends-on ("alexandria"
	       "lisp-stat"
	       "array-operations"
	       "data-frame"
	       "num-utils"
	       "select"
	       "plot/vega")

  :pathname "src/"		     ;keep files in this directory
  :components ((:file "pkgdcls")	;package declarations and exports
	       (:file "init")		;project wide variables & set-up
	       (:file "load")
	       (:file "analyse")	;your analysis or module
	       (:file "plot")
	       (:file "save"))
  :in-order-to ((test-op (test-op project-name/tests)))) ;tests are optional


(defsystem :project/tests
  :version "1.0.0"
  :description "Unit tests for Project Name"
  :author "Your name here"
  :license :Apache-2.0
  :depends-on ("project-name" "parachute") ;we recommend parachute or cl-unit2
  :serial t
  :pathname "tests/"
  :components ((:file "tstpkg")
	       (:file "analyse"))
  :perform (test-op (o s)
  		    (symbol-call :ls-tests :run-tests)))
