
; public api


(defun new-scanner (str) 
  (cons str 0))

(defun next-token (scanner)
  (unread-whitespace! scanner) 
  (read-token! scanner))

; private api

(defun next+ (scanner i)
   (rplacd scanner (+ i (cdr scanner)))
   scanner)

(defun next (scanner)
   (cdr scanner))

(defun next-char (scanner)
   (next-char-n scanner 0))

(defun next-char-n (scanner n)
   (char (input scanner) (+ n (next scanner))))

(defun input (scanner)
   (car scanner))

(defun whitespacep (c)
  (or (eql c #\newline) (eql c #\tab) (eql c #\space)))

(defun read-token! (scanner)
  (let (l token)
    (setq l (len-non-whitespace scanner 0))
    (setq token (subseq (input scanner) (next scanner) (+ (next scanner) l)))
    (next+ scanner l)
    token))

(defun len-non-whitespace (scanner len)
   (if (whitespacep (next-char-n scanner len))
      len
      (len-non-whitespace scanner (1+ len))))

(defun unread-whitespace! (scanner)
   (if (whitespacep (next-char scanner))
     (unread-whitespace! (next+ scanner 1))
     scanner))


