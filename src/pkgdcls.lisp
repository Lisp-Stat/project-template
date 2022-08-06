;;; -*- Mode: LISP; Base: 10; Syntax: ANSI-Common-lisp; Package: CL-USER -*-

#| This file defines the package name, which need not be the same as the
system name in the .asd file, the third party dependencies that your
project will use, and the functions & variables (the SYMBOLS) that
your project will export to others.

It's good practice to fill in all of the documentation fields, both to
make it clear to users of your system what the packages do, and to
have the documentation automatically generated.  You may define more
than one package in this file. |#

;;; We use uiop:define-package instead of cl:defpackage because it
;;; behaves a bit better when redefining the package in the REPL.

(uiop:define-package #:project
  (:documentation "This system implements Cost of Data Analysis.  One symbol is exported, analyse that will ...")

  #| You can :USE a package to import all of its symbols.  Generally, you
  should only do this for systems you have control over, will always
  be using, or when you are using most of the symbols in the
  package. |#
  (:use :common-lisp :lisp-stat)

  #| When you need a few symbols from a package, use :IMPORT-FROM |#
  (:import-from #:alexandria+ #:unlessf) ;import a single function from the alexandria+ system


  #| If you are developing an add-on package, you'll want to export all
  of your libraries functions in the export statement. |#
  (:export #:analyse))			;export a single function

