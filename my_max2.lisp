(defun my_max (x)
  (let ((local_max (car x)))
    (dolist (a x)
      (if (< local_max a)
	  (setf max a)
	local_max))
    max))
(format t "input list:")
(format t "max = ~A~%" (my_max (read)))