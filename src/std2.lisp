

#|
TODO Funktionen, die in die StdLib von Acheron gehören
|#

(defnative char (str idx) #{
    return str.charAt(idx);
}#)

(defnative subseq (str start end) #{
   return str.substring(start, end);
}#)

(defun >= (a b) 
  (or (> a b) (eql a b)))

