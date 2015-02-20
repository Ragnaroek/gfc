

(deftest should-return-eof-one-scanner-with-empty-string
    (assert-that (next-token (new-scanner "")) (is :EOF)))

(deftest should-always-return-eof-if-eof-reached
   (let ((scanner (new-scanner "")))
       (next-token scanner)
       (next-token scanner)
       (assert-that (next-token scanner) (is :EOF))))

(deftest should-return-continue-keyword
   (assert-that (next-token (new-scanner "CONTINUE")) (is :continue)))

(deftest should-return-power-keyword
   (assert-that (next-token (new-scanner "**")) (is :**)))

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

;TODO ERROR Cases : I123456 --> too long
;TODO check stream of tokens
