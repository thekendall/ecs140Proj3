(defun isPrime (num i)
  (if (equal i 1)
	(list num)
	(if (/= (mod num i) 0)
	   	(isPrime num (- i 1))
		)
	)
)

(defun prime (num)
  ( if (equal 2 num) 
	   (list num)
	   (append (isPrime num (- num 1)) (prime (- num 1)))
  )
)
(print (reverse (prime 199)))
