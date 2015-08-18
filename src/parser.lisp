
(defspecial *scanner* nil )

; public api
(defun parse (str)
  (let ((*scanner* (new-scanner str)))
    (parse-stmt-list)
    (match :eof)
    T))

; private api

(defun case-lookahead-test-fn (a b)
  (if (eq a T) T (equal a b)))

(defmacro case-lookahead (&rest cases)
  (let ((l (gensym)) (c (gensym)))
     `(let ((,l (lookahead *scanner*)))
        (let ((,c (find ,l ',cases :test 'case-lookahead-test-fn)))
          (when ,c (funcall ,c))))))

(defun match (token)
  (let ((next-token (next-token *scanner*)))
    (print-debug next-token)
    (print-debug token)
    (print-debug "----")
    (unless (eq (car next-token) token)
      (error (concatenate "parser error, unexpected symbol: " (car next-token) " expected: " token)))))

(defun parse-stmt-list ()
  (parse-stmt-line)
  (unless (equal (cons :eof nil) (lookahead *scanner*))
     (parse-stmt-list)))

(defun parse-stmt-line ()
  (match :fixnum)
  (parse-statement)
  (match :eol))

(defun parse-statement ()
  (case-lookahead
     (:DO parse-do)
     (T parse-formula)))

(defun parse-formula ()
  (match :fixnum)) ; only that atm

(defun parse-do ())
