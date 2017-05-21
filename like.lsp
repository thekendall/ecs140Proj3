(defun conditionalReturn (a b) ; helper tries T for a, b, default
	(if (nth 0 a)
		a
		(if (nth 0 b)
			b
			(list Nil Nil)
		)
	)
)
(defun conditionalAppend(a b) ; helper tries to append b or nil if it is an empty string
	(if (equal b "")
		(append a (list Nil))
		(append a (list b))
	)
)


(defun like (tester str wildcard)
	(if (equal (length tester) 0) ; if tester.length == 0
		(if (equal (length str) 0) ; if str.length == 0
			(list T Nil)
			(list Nil Nil)
		)
		(if (> (length str) 0) ; else if str length > 0
			(if (equal (subseq tester 0 1) (subseq str 0 1))  ; if character is same or underscore 
				(like (subseq tester 1 (length tester))
					  (subseq str 1 (length str)) ""
				)
				(if  (equal (subseq tester 0 1) "_")
					(append (like (subseq tester 1 (length tester))
						  (subseq str 1 (length str)) ""
					) (list (subseq str 0 1))
					)
					
					(if (equal (subseq tester 0 1) "%")
						(conditionalReturn	
							(conditionalAppend (like (subseq tester 1 (length tester)) str "" )  ; 
								  wildcard ; Appends the last recursive % or empty
							) ; appends the last wildcard to the list
							(like tester (subseq str 1 (length str)) (concatenate 'string wildcard (subseq str 0 1))) ; Recursively looks for wild cards to attend
						)
						(list Nil Nil)
					)
				)
			)
			(if (and (equal (subseq tester 0 1) "%") (= (length tester) 1)) ; If the last character is a wildcard
				(list T Nil wildcard)
				(list Nil Nil)
			)
				
		)
	)	
)

(defun formatLike (l)
	(if (> (list-length l) 2) 
		(list T (reverse (cdr (cdr l)) )) ;reverse probably unnecessary
		l
	)
)

(defun like-match(tester str)
	(formatLike (like tester str ""))
)

(print (like-match "h%__%" "hello" ))
(print (like-match "h%l%_%" "hello"))
