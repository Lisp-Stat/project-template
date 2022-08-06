;;; -*- Mode: LISP; Base: 10; Syntax: ANSI-Common-lisp; Package: PROJECT -*-

;;; project initialisation

#| This template does not require global initialsation variables.
Examples of global environment variables that you might want to set
include the data directories.  Lisp-Stat has an initialisation file
that uses relative logical pathnames based on the directory where the
source code is found.  The most common reason to change this is if you
obtained Lisp-Stat from Quicklisp.  In this case the Quicklisp
directories may not be the most convienent to work with and you'll
want to change the directories.  See
https://github.com/Lisp-Stat/lisp-stat/blob/master/ls-init.lisp for
examples.

Another example is found in YASON encoding; we set this globally to
plists; whilst you probably don't want to change that value, if you
use other systems (libraries), they may need global defaults.  |#

(defun setup-ls-translations ()
  (setf (logical-pathname-translations "PROJECT")
	`(("DATA;**;*.*.*"    ,(merge-pathnames "data/**/*.*" (asdf:system-source-directory 'project))))))

(setup-ls-translations)
