

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
   
;(deftest should-return-fixnum
;   (assert-that (next-token (new-scanner "1")) (is (cons :keyword 1))))
