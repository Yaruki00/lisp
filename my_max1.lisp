(defun my_max (x)
  (if (null (cdr x))
      ;; then
      (car x)
    ;; else
    (progn (let ((local_max (my_max (cdr x))))
	   (if (> (car x) local_max)
	       ;; then
	       (car x)
	     ;;else
	     local_max)))))
(format t "input list:")
(format t "max = ~A~%" (my_max (read)))