(defvar sml-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\( "(")
    (modify-syntax-entry ?\) ")")
    (modify-syntax-entry ?\" "\"")
    (modify-syntax-entry ?\( "(). 1" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?\) ")(. 4" st)
    st))

(defvar keywords
  (regexp-opt
   '("struct" "structure" "end" "local" "fun"
     "val" "in" "let" "open" "include" "ref"
     "case" "of" "signature" "sig" "type" "and"
     "andalso" "orelse" "if" "then" "else"
     "exception" "datatype" "fn" "rec" "functor"
     "where")
   'words))

(defvar operators
  (regexp-opt
   '(":" "=" ":=" "!" "<>" "^" "+" "-" "*" "/" "::"
     "=>" "->" ">" "<" "~" "|" "_" "," "." ";" "@"
     ">=" "<=" ":>")
   nil))

(defvar builtins
  (regexp-opt
   '("list" "int" "bool" "double" "string" "char"
     "unit" "true" "false" "div" "mod" "not")
   'symbols))

(defvar comment-delimiters
  (regexp-opt
   '("(*" "*)")
   'symbols))

(defvar sample-font-lock-keywords
  `((,keywords . font-lock-keyword-face)
    (,comment-delimiters . font-lock-comment-delimiter-face)
    (,operators . font-lock-comment-delimiter-face)
    (,builtins . font-lock-builtin-face)
    ("\\<fun \\([a-zA-Z][a-zA-Z0-9]+\\)\\>" 1 font-lock-function-name-face)
    ("\\<and \\([a-zA-Z][a-zA-Z0-9]+\\)\\>" 1 font-lock-function-name-face)))

(define-derived-mode sml-mode fundamental-mode "Standard ML"
  "A major mode for Standard ML."
  :syntax-table sml-mode-syntax-table
  (setq comment-multi-line nil)
  (setq-local comment-start "(*")
  (setq-local comment-end "*)")
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
  (setq-local font-lock-defaults '(sample-font-lock-keywords)))

(provide 'sml-mode)
