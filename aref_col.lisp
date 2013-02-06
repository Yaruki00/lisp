(defun aref-col (ary row)
  (let* ((ary-row (array-dimension ary 0))
	 (result-col (make-array (list ary-row 1))))
    (dotimes (i ary-row result-col)
      (setf (aref result-col i 0) (aref ary i row)))))