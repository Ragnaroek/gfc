#|
atu = Acheron Test Util
|#

(defspecial *thing* nil)
(defspecial *tests* nil)
(defspecial *current-test* nil)

;ADT Test
(defun make-test (name code)
   (list :test name code))

(defun test-name (test)
   (nth 1 test))

(defun test-code (test)
   (nth 2 test))
;END ADT Test

(defmacro defmatcher (name args &rest body)
   `(defun ,name ,args #'(lambda (*thing*) ,@body)))

(defmatcher is (spec)
   (equal spec *thing*))

; The idea is to make it configurable what to do on an error.
; Currently fail hard with an exception.
(defun on-mismatch (p)
  (unless p (error (concatenate (test-name *current-test*) " failed (detailed explanation TODO)"))))

(defun assert-that (thing matcher)
   (on-mismatch (funcall matcher thing)))

(defmacro deftest (name &rest body)
  `(setq *tests* (cons (make-test (__str-coercion ',name) #'(lambda () ,@body)) *tests*))) 

(defun run-tests () 
   (mapcar #'(lambda (test) (let ((*current-test* test)) (apply (test-code test) nil))) *tests*)
   (length *tests*))

