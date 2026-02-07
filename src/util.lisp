(in-package :cl-user)
(defpackage clack.util
  (:use :cl)
  (:import-from :lack.util
                :find-package-or-load)
  (:export :find-handler))
(in-package :clack.util)

(defun find-handler (server)
  (let ((name (symbol-name server)))
    (or (find-package-or-load (concatenate 'string
                                           #.(string '#:clack/handler/)
                                           name))
        (find-package-or-load (concatenate 'string
                                           #.(string '#:clack.handler.)
                                           name)
                              t)
        (error "~S is unknown handler." server))))
