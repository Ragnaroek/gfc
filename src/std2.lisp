
#|
TODO Funktionen, die in die StdLib von Acheron gehören und dort auch bald integriert werden.
|#

(defnative print-debug (obj) #{
   console.log(obj);
}#)

(defnative char (str idx) #{
    return str.charAt(idx);
}#)

(defnative subseq (str start end) #{
   return str.substring(start, end);
}#)

(defun str-first (str)
  (subseq str 0 1))

(defun >= (a b) 
  (or (> a b) (eql a b)))

(defun concatenate (&rest strs)
  (reduce #'__str-conc strs ""))

(defnative js-prop (obj prop) #{
   return obj[prop];
}#)

(defun @. (obj prop-designator)
   (js-prop obj (__str-coercion prop-designator)))

(defnative str-ends-with (str withend) #{
    if(str.endsWith(withend)) {
      return acheron.t;
    } else {
      return acheron.nil;
    }
}#)

(defnative try-catch (bodyf catchhandler) #{
   try {
     bodyf();
   } catch(e) {
     catchhandler(e);
   }
}#)

(defnative regex (str) #{
   return new RegExp(str);
}#)

(defnative regex-test (regex str) #{
   return regex.test(str)?acheron.t:acheron.nil;
}#)

(defnative parse-integer (str) #{
   return parseInt(str, 10);
}#)

(defnative parse-float (str) #{
   return parseFloat(str);
}#)

(defun find (e l)
  (when l 
    (if (equal e (car l)) e (find e (cdr l)))))
