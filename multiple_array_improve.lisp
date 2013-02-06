(defun multiple-array (ary1 ary2)
  (let ((ary1-dim (cdr (array-dimensions ary1)))
	(ary2-dim (cddr (array-dimensions ary2))))
    ;; ary1が一次元以下、ary2が二次元以下であることを確認
    (if (or (not (null ary1-dim))
	    (not (null ary2-dim)))
	(progn (format t "ary1-dim ~A ary2-dim ~A~%"
		       ary1-dim ary2-dim)
	       (return-from multiple-array))
      (let ((ary1-col-num (array-dimension ary1 0))
	    (ary2-row-num (array-dimension ary2 0))
	    (ary2-col-num (array-dimension ary2 1)))
	;; ary1の列数とary2の行数が一致することを確認
	(if (or (/= ary1-col-num ary2-row-num)
		(/= ary2-col-num 1))
	    (progn (format t "ary1-col-num=~A ary2-row-num=~A~%"
			   ary1-col-num ary2-row-num)
		   (return-from multiple-array))
	  (let ((result 0))
	    (dotimes (i ary1-col-num result)
	      (setf result (+ result (* (aref ary1 i) (aref ary2 i 0)))))))))))

(format t "result=~A~%" (multiple-array #1a(1 2 3 4 5) #2a((1)(2)(3)(4)(5))))
(format t "result=~A~%" (multiple-array #1a(1 2 3 4 5) #2a((1)(2)(3)(4))))
(format t "result=~A~%" (multiple-array #1a(1 2 3 4 5) #3a(((1)(2)(3)(4)(5)))))