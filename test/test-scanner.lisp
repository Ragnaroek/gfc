
(deftest should-return-eof-one-scanner-with-empty-string
    (assert-that (next-token (new-scanner "")) (is (cons :eof nil))))

(deftest should-always-return-eof-if-eof-reached
   (let ((scanner (new-scanner "")))
       (next-token scanner)
       (next-token scanner)
       (assert-that (next-token scanner) (is (cons :eof nil)))))

(deftest should-return-continue-keyword
   (assert-that (next-token (new-scanner "CONTINUE")) (is (cons :keyword :continue))))

(deftest should-return-eol
   (assert-that (next-token (new-scanner "\n")) (is (cons :eol NIL))))

(deftest should-return-power-keyword
   (assert-that (next-token (new-scanner "**")) (is (cons :keyword :**))))

(deftest should-return-function-name 
   (assert-that (next-token (new-scanner "SINF")) (is (cons :function-name "SINF"))))
   
(deftest should-return-fixnum-low
   (assert-that (next-token (new-scanner "1")) (is (cons :fixnum 1))))

(deftest should-return-fixnum-mid
   (assert-that (next-token (new-scanner "128")) (is (cons :fixnum 128))))

(deftest should-return-floating-point
   (assert-that (next-token (new-scanner "3.1415")) (is (cons :float 3.1415))))

(deftest should-return-fixnum-variable
   (assert-that (next-token (new-scanner "IVAR")) (is (cons :fixnum-var "IVAR"))))

(deftest should-return-fixnum-variable-with-numeric-in-it
   (assert-that (next-token (new-scanner "N6")) (is (cons :fixnum-var "N6"))))

(deftest should-return-float-variable
   (assert-that (next-token (new-scanner "VAR")) (is (cons :float-var "VAR"))))

(deftest should-scan-list
   (let ((scanner (new-scanner "LIGHT 7\tMAXF \n764     N764 FLOATV  ")))
     (assert-that (next-token scanner) (is (cons :keyword :light)))	   
     (assert-that (next-token scanner) (is (cons :fixnum 7)))
     (assert-that (next-token scanner) (is (cons :function-name "MAXF")))
     (assert-that (next-token scanner) (is (cons :eol NIL)))
     (assert-that (next-token scanner) (is (cons :fixnum 764)))
     (assert-that (next-token scanner) (is (cons :fixnum-var "N764")))
     (assert-that (next-token scanner) (is (cons :float-var "FLOATV")))))

(deftest should-scan-a-second-list
   (let ((scanner (new-scanner "10  42\n20   42")))
     (assert-that (next-token scanner) (is (cons :fixnum 10)))
     (print-debug (lookahead scanner))
     (assert-that (next-token scanner) (is (cons :fixnum 42)))
     (assert-that (next-token scanner) (is (cons :eol nil)))
     (assert-that (next-token scanner) (is (cons :fixnum 20)))
     (assert-that (next-token scanner) (is (cons :fixnum 42)))))

(deftest should-lookahead-without-advancing
    (let ((scanner (new-scanner "LIGHT 42")))
      (assert-that (lookahead scanner) (is (cons :keyword :light)))
      (assert-that (lookahead scanner) (is (cons :keyword :light)))
      (assert-that (next-token scanner) (is (cons :keyword :light)))
      (assert-that (lookahead scanner) (is (cons :fixnum 42)))
      (assert-that (next-token scanner) (is (cons :fixnum 42)))
      (assert-that (next-token scanner) (is (cons :eof nil)))))

;TODO ERROR Cases : I123456 --> too long
