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

(defun aref-row (ary col)
  (let* ((ary-col (array-dimension ary 1))
	 (result-row (make-array (list ary-col))))
    (dotimes (i ary-col result-row)
      (setf (aref result-row i) (aref ary col i)))))

(defun aref-col (ary row)
  (let* ((ary-row (array-dimension ary 0))
	 (result-col (make-array (list ary-row 1))))
    (dotimes (i ary-row result-col)
      (setf (aref result-col i 0) (aref ary i row)))))

(defun multiple-array2 (ary1 ary2)
  (let ((ary1-row-num (array-dimension ary1 0))
	(ary2-col-num (array-dimension ary2 1)))
    (if (/= ary1-row-num ary2-col-num)
	(progn (format t "ary1-row-num=~A ary2-col-num=~A~%"
		       ary1-row-num ary2-col-num)
	       (return-from multiple-array2 1)))
    (let ((result-array (make-array (list ary1-row-num ary2-col-num))))
      (dotimes (i ary1-row-num result-array)
	(dotimes (j ary2-col-num nil)
	  (setf (aref result-array i j)
		(multiple-array (aref-row ary1 i) (aref-col ary2 j))))))))

(format t "result=~A~%" (multiple-array2 #2a((1 2 3) (4 5 6)) #2a((1 2)(3 4)(5 6))))