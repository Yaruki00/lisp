(defun aref-row (ary col)
  (let* ((ary-col (array-dimension ary 1))
	 (result-row (make-array (list ary-col))))
    (dotimes (i ary-col result-row)
      (setf (aref result-row i) (aref ary col i)))))

(format t "result=~A~%" (aref-row #2a((1 2 3)(4 5 6)) 0))