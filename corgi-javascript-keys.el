;;; -*- no-byte-compile: t -*-

(bindings
 (normal|visual
  (","
   ("r" "Refactor"
    ("a"
     ("a" "Toggle async" :refactor/toggle-async)
     ("p" "Add parameter" :refactor/introduce-parameter)
     ("t" "Add this" :refactor/to-this))
    ("e"
     ("l" "Extract let" :refactor/extract-let)
     ("m" "Extract method" :refactor/extract-method)
     ("v" "Extract var" :refactor/extract-var))
    ("f" "Wrap for loop" :refactor/wrap-for)
    ("l" "Logging"
     ("l" "Log this" :refactor/log-this)
     ("d" "Debug this" :refactor/debug-this))
    ("r" "Rename var" :refactor/rename-var)
    ("T" "Transpose"
     ("a" "Toggle arrow function" :refactor/toggle-arrow-function)
     ("i" "Wrap iife" :rafactor/wrap-iife)
     ("I" "Unwrap iife" :refactor/unwrap-iife)
     ("o" "Arguments to object" :refactor/arguments-to-object)
     ("s" "String to template" :refactor/string-to-template)
     ("t" "Ternary to if" :refactor/ternary-to-if))))))
