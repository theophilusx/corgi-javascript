((js-mode ( :eval/last-sexp js-send-last-sexp
            :eval/buffer js-send-buffer
            :eval/region js-send-region
            :repl/toggle js-comint-start-or-switch-to-repl

            :jump/next-error flycheck-next-error
            :jump/prev-error flycheck-previous-error

            :project/diagnostics flycheck-list-errors

			:refactor/log-this js2r-log-this
			:refactor/debug-this js2r-debug-this
			:refactor/rename-var js2r-rename-var
			:refactor/extract-let js2r-extract-let
			:refactor/extract-var js2r-extract-var
			:refactor/unwrap-iife js2r-unwrap-iife
			:refactor/to-this js2r-to-this
			:refactor/wrap-iife js2r-wrap-iife
			:refactor/ternary-to-if js2r-ternary-to-if
			:refactor/extract-method js2r-extract-method
			:refactor/extract-function js2r-extract-function
			:refactor/wrap-for js2r-wrap-in-for-loop
			:refactor/string-to-template js2r-string-to-template
			:refactor/arguments-to-object js2r-arguments-to-object
			:refactor/introduce-paramater js2r-introduce-parameter
			:refactor/toggle-async js2r-toggle-async
			:refactor/toggle-arrow-function js2r-toggle-arrow-function-and-expression
			)))
