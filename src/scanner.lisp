
; public api

(defspecial *KEYWORDS* (make-hash-table))
(sethash "CONTINUE" *KEYWORDS* :continue)
(sethash "=" *KEYWORDS* :eq)
(sethash "DO" *KEYWORDS* :do)
(sethash "," *KEYWORDS* :comma)
(sethash "GO" *KEYWORDS* :go)
(sethash "TO" *KEYWORDS* :to)
(sethash "IF" *KEYWORDS* :if)
(sethash "(" *KEYWORDS* :lparen)
(sethash ")" *KEYWORDS* :rparen)
(sethash "SENSE" *KEYWORDS* :sense)
(sethash "LIGHT" *KEYWORDS* :light)
(sethash "SWITCH" *KEYWORDS* :switch)
(sethash "+" *KEYWORDS* :+)
(sethash "-" *KEYWORDS* :-)
(sethash "*" *KEYWORDS* :*)
(sethash "/" *KEYWORDS* :/)
(sethash "**" *KEYWORDS* :**)
(sethash "#" *KEYWORDS* :hash)

(defun new-scanner (str) 
  (cons str 0))

(defun next-token (scanner)
  (if (>= (next scanner) (length (input scanner)))
    :eof
    (progn
       (unread-whitespace! scanner) 
       (read-token! scanner))))

; private api

(defun next+ (scanner i)
   (rplacd scanner (+ i (cdr scanner)))
   scanner)

(defun next (scanner)
   (cdr scanner))

(defun next-char (scanner)
   (next-char-n scanner 0))

(defun next-char-n (scanner n)
   (if (> n (length (input scanner)))
     nil
     (char (input scanner) (+ n (next scanner)))))

(defun input (scanner)
   (car scanner))

(defun whitespacep (c)
  (or (eql c #\newline) (eql c #\tab) (eql c #\space)))

(defun make-token (str)
  (or (fortran-keyword str) 
      (fortran-function-name str) 
      (fortran-fixnum str)
      (fortran-float str)
      (fortran-fixnum-variable str)
      (fortran-float-variable str)
      (error (concatenate "illegal token: " str))))

(defun fortran-keyword (str)
   (gethash str *KEYWORDS*))

(defun fortran-function-name (str)
   (when (str-ends-with str "F")
     (cons :function-name str)))

;TODO Regex nicht immer neu erzeugen, sondern cachen!
(defun fortran-fixnum (str)
  (when (regex-test (regex "^[1-9]([0-9])*$") str)
    (cons :fixnum (parse-integer str)))) 

(defun fortran-float (str)
  (when (regex-test (regex "^(([1-9][0-9]*\\.?[0-9]*)|(\\.[0-9]+))([Ee][+-]?[0-9]+)?$") str)
    (cons :float (parse-float str))))

(defun fortran-fixnum-variable (str)
  (when (and (< (length str) 7) (has-fixnum-prefix str))
    (cons :fixnum-var str)))

(defun fortran-float-variable (str)
  (when (and (< (length str) 7) (not (has-fixnum-prefix str)))
    (cons :float-var str)))

(defun has-fixnum-prefix (str)
   (find (str-first str) '("I" "J" "K" "L" "M" "N")))

(defun read-token! (scanner)
  (let (l token)
    (setq l (len-non-whitespace scanner 0))
    (setq token (subseq (input scanner) (next scanner) (+ (next scanner) l)))
    (next+ scanner l)
    (make-token token)))

(defun len-non-whitespace (scanner len)
   (let ((c (next-char-n scanner len))) 
      (if (or (not c) (whitespacep c))
         len
         (len-non-whitespace scanner (1+ len)))))

(defun unread-whitespace! (scanner)
   (if (whitespacep (next-char scanner))
     (unread-whitespace! (next+ scanner 1))
     scanner))


