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
(require 'diminish)
(require 'corkey)

(straight-use-package 'js2-mode)

(setq-default js2-bounce-indent-p nil)
(setq js-indent-level 2
      js2-include-node-externs t
      js2-mode-assume-strict t
      js2-highlight-level 3
      js2-global-externs '("describe" "it" "before"
                           "after" "beforeEach" "afterEach"))

(require 'js2-mode)
(js2-imenu-extras-setup)
(define-key js2-mode-map (kbd "M-.") nil)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(straight-use-package 'xref-js2)
(require 'xref-js2)
(add-hook 'js2-mode-hook
          #'(lambda ()
              (add-hook 'xref-backend-functions #'xref-js2-xref-backend)))

(straight-use-package 'js2-refactor)
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(diminish 'js2-refactor-mode)

(straight-use-package 'add-node-modules-path)
(require 'add-node-modules-path)
(add-hook 'js2-mode-hook #'add-node-modules-path)

(straight-use-package 'prettier-js)
(setq prettier-js-args '("--print-width" "80"
                         "--tab-width" "2")
      prettier-js-width-mode 'fill)
(require 'prettier-js)
(add-hook 'js2-mode-hook #'prettier-js-mode)
(diminish 'prettier-js-mode)

(straight-use-package 'tide)
(require 'tide)
(add-hook 'typescript-mode-hook #'(lambda ()
                                    (tide-setup)
                                    (tide-hl-identifier-mode +1)))

(straight-use-package 'js-comint)
(require 'js-comint)

(defun corgi-javascript/add-default-bindings ()
  (add-to-list 'corkey-signal-files-list 'corgi-javascript-signals t)
  (add-to-list 'corkey-key-files-list 'corgi-javascript-keys t)
  (corkey/load-and-watch corkey-key-files-list corkey-signal-files-list))

(provide 'corgi-javascript)
;; corgi-javascript.el ends here
