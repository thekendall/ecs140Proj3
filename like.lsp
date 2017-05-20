(defun conditionalReturn (a b) ; helper tries T for a, b, default
	(if (nth 0 a)
		a
		(if (nth 0 b)
			b
			(list Nil Nil)
		)
	)
)


(defun like (tester str)
	(if (equal (length tester) 0) ; if tester.length == 0
		(if (equal (length str) 0) ; if str.length == 0
			(list T nil)
			(list Nil Nil)
		)
		(if (> (length str) 0) ; else if str length > 0
			(if (or (equal (subseq tester 0 1) (subseq str 0 1))  (equal (subseq tester 0 1) "_")) ; if character is same or underscore 
				(like (subseq tester 1 (length tester))
					  (subseq str 1 (length str)) 
				)
				(if (equal (subseq tester 0 1) "%")
					(conditionalReturn	
						(like (subseq tester 1 (length tester))
							  str 
						)
						(append 
							(like tester (subseq str 1 (length str)) )
							(list (subseq str 0 1))
						)
					)
					(list Nil Nil)
				)
			)
			(if (and (equal (subseq tester 0 1) "%") (= (length tester) 1))
				(list T Nil)
				(list Nil Nil)
			)
				
		)
	)	
)

(print (like "he%llo" "helllllo"))
