(defun multiple-array (ary1 ary2)
  (let ((ary1-col-num (array-dimension ary1 0))
	(result 0))
    (dotimes (i ary1-col-num result)
      (setf result (+ result (* (aref ary1 i) (aref ary2 i 0)))))))

(format t "result=~A~%" (multiple-array #1a(1 2 3 4 5) #2a((1)(2)(3)(4)(5))))