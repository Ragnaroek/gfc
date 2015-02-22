
(defspecial *scanner* nil )

; public api
(defun parse (str)
  (let ((*scanner* (new-scanner str)))
    (parse-stmt-list)
    (match :eof)
    T))

; private api

(defun match (token)
  (let ((next-token (next-token *scanner*)))
    (print-debug next-token)
    (print-debug token)
    (print-debug "----")
    (unless (eq (car next-token) token)
      (error (concatenate "parser error, unexpected symbol"))))) ; TODO better error message

(defun parse-stmt-list ()
  (parse-stmt-line)
  (unless (equal (cons :eof nil) (lookahead *scanner*))
     (parse-stmt-list)))

(defun parse-stmt-line ()
  (match :fixnum)
  (parse-statement)
  (match :eol))

(defun parse-statement ()
  (match :fixnum) ; TODO real parse of statement!!
  )
