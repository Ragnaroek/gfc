
(defnative print (str) #{
   document.write(str);
}#)

(defun println (str) 
  (print str)
  (print "<br/>")
)

(defun main ()
  (println "main:")
  (let ((scanner (new-scanner "IFXXYYY SENSE LIGHT X")))
      (println (next-token scanner))
      (println (next-token scanner))
      (println (next-token scanner))
      ))
