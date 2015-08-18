

(deftest should-parse-two-statements
   (assert-that (parse "10  42\n20   42\n") (is T)))

;(deftest should-parse-do-statement-without-increment
;   (assert-that (parse "10 DO 50 I=10,50")))
