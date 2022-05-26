((js-mode ( :eval/last-sexp js-send-last-sexp
            :eval/buffer js-send-buffer
            :eval/region js-send-region
            :repl/toggle js-comint-start-or-switch-to-repl

            :jump/next-error flycheck-next-error
            :jump/prev-error flycheck-previous-error

            :projec/diagnostics flycheck-list-errors)))
