

(deftest should-parse-two-statements
   (assert-that (parse "10  42\n20   42\n") (is T)))
