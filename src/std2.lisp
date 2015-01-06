
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

