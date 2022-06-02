;;; corgi-javascript.el -- javascript support for corgi-emacs -*- lexical-binding: t -*-
;;
;; Filename: corgi-javascript.el
;; Package-Requires ((js2-mode) (xref-js2) (js2-refactor) (add-node-modules-path) (prettier-js) (tide) (js-comint))
;;
;;; Commentary
;;
;; Basic setup for Javascript development within corgi-emacs. a
;;
;;; Code

(require 'straight)
(require 'corkey)

(use-package js2-mode
  :diminish t
  :mode "\\.js\\'"
  :interpreter ("node" . js2-mode)
  :init
  (setq-default js2-bounce-indent-p nil)
  (setq js-indent-level 2
        js2-include-node-externs t
        js2-mode-assume-strict t
        js2-highlight-level 3
        js2-global-externs '("describe" "it" "before"
                             "after" "beforeEach" "afterEach"))
  :commands (js2-mode)
  :hook ((js2-mode . js2-imenu-extras-mode))
  :config
  (js2-imenu-extras-setup)
  (define-key js2-mode-map (kbd "M-.") nil))

(use-package xref-js2
  :diminish t
  :commands (xref-js2-xref-backend)
  :hook ((js2-mode . (lambda ()
                       (add-hook 'xref-backend-functions #'xref-js2-xref-backend)))))

(use-package js2-refactor
  :diminish t
  :commands (js2-refactor-mode)
  :hook (js2-mode . js2-refactor-mode)
  :config
  (diminish 'js2-refactgor-mode))

(use-package add-node-modules-path
  :commands (add-node-modules-path)
  :hook ((js2-mode . #'add-node-modules-path)))

(use-package prettier-js
  :init
  (setq prettier-js-args '("--print-width" "80"
                           "--tab-width" "2")
        prettier-js-width-mode 'fill)
  :commands (prettier-js-mode)
  :diminish t
  :hook ((js2-mode . prettier-js-mode))
  :config
  (diminish 'prettier-js-mode))

(use-package tide
  :commands (tide-setup)
  :hook ((typescript-mode . (lambda ()
                              (tide-setup)
                              (tide-hl-identifier-mode +1)))))

(use-package js-comint
  :commands (js-comint-start-or-switch-to-repl))

(defun corgi-javascript/add-default-bindings ()
  (add-to-list '*signal-files-list* 'corgi-javascript-signals t)
  (add-to-list '*key-files-list* 'corgi-javascript-keys t)
  (corkey/load-and-watch *key-files-list* *signal-files-list*))

(provide 'corgi-javascript)
;; corgi-javascript.el ends here
