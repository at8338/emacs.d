;;; morlock-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "morlock" "morlock.el" (21865 4270 712665 300000))
;;; Generated autoloads from morlock.el

(autoload 'morlock-mode "morlock" "\
Highlight more font-lock keywords.

\(fn &optional ARG)" t nil)

(defvar global-morlock-mode nil "\
Non-nil if Global-Morlock mode is enabled.
See the command `global-morlock-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-morlock-mode'.")

(custom-autoload 'global-morlock-mode "morlock" nil)

(autoload 'global-morlock-mode "morlock" "\
Toggle Morlock mode in all buffers.
With prefix ARG, enable Global-Morlock mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Morlock mode is enabled in all buffers where
`turn-on-morlock-mode-if-desired' would do it.
See `morlock-mode' for more information on Morlock mode.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; morlock-autoloads.el ends here
