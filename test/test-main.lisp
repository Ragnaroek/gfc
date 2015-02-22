
(defun run-tests-and-write-result ()
  (write (concatenate "tests successful: " (__str-coercion (run-tests)))))

(defun write-test-failure (e) 
  (write (concatenate "test failed: " (@. e "message"))))

(defun main ()
  ;(print-debug (next-token (new-scanner "  \n764"))) 
  ;(print-debug (fortran-float "N6"))
  (try-catch #'run-tests-and-write-result #'write-test-failure))
