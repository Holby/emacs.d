;;; vhdl-tools-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "vhdl-tools" "vhdl-tools.el" (0 0 0 0))
;;; Generated autoloads from vhdl-tools.el

(autoload 'vhdl-tools-mode "vhdl-tools" "\
Utilities for navigating vhdl sources.

If called interactively, enable Vhdl-Tools mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

Key bindings:
\\{map}

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "vhdl-tools" '("vhdl-tools-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; vhdl-tools-autoloads.el ends here
