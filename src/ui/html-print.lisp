
#| Funktionen zur Ausgabe in HTML |#


(defun write (obj)
  (if (eq obj T)
    (@write "T")
    (if (eq obj NIL)
      (@write "NIL")
      (@write obj)))) 

(defnative @write (str) #{
   document.write(str);
}#)
