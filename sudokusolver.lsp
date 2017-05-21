(defun getElem(board i j) ; Used for accessing element at row i, column j
  (nth 0 (nth i board))
)

(defun setrow(row i value) ;set a specific row value at i location to value
  	(if (> i 0)
	  	(cons (car row) (setrow (cdr row) (1- i) value))
		(cons value (cdr row)))
)

(defun setboard(board row column value) ;setting element at row,column to value
  	(if (> row 0)
	  	(cons (car board) (setboard (cdr board) (1- row) column value))
		(cons (setrow (car board) column value) (cdr board)))
)

(defun iteraterow(row value) ;iterates through a list and compares values
  	(if(= (list-length row) 0)
		T
		(if (=(car row) value)
			NIL
			(iteraterow (cdr row) value)))
)
(defun checkRow(board row value) ;checks board at given row of certain value
	(iteraterow (nth row board) value)
)

(defun getColumn(board column) ;gets the column specified
  	(if (= (list-length board) 0)
	  NIL
  	(cons (nth column (car board)) (getColumn (cdr board) column)))
)
(defun checkColumn(board column value) ;checks board at given column of certain value
	(iteraterow (getColumn board column) value)
)

(defun checkQuadrantOne(board value)
	(if (= (nth 0 (car board)) value)
		NIL
		(if (= (nth 1 (car board)) value)
			NIL
			(if(= (nth 0 (car (cdr board))) value)
				NIL
				(if(= (nth 1 (car (cdr board))) value)
				 	NIL
					T))))
)

(defun checkQuadrantTwo(board value)
	(if (= (nth 2 (car board)) value)
		NIL
		(if (= (nth 3 (car board)) value)
			NIL
			(if(= (nth 2 (car (cdr board))) value)
				NIL
				(if(= (nth 3 (car (cdr board))) value)
				 	NIL
					T))))
)

(defun checkQuadrantThree(board value)
	(if (= (nth 0 (car (cdr (cdr board)))) value)
		NIL
		(if (= (nth 1 (car (cdr (cdr board)))) value)
			NIL
			(if(= (nth 0 (car (cdr (cdr (cdr board))))) value)
				NIL
				(if(= (nth 1 (car (cdr (cdr (cdr board))))) value)
				 	NIL
					T))))

)

(defun checkQuadrantFour(board value)
	(if (= (nth 2 (car (cdr (cdr board)))) value)
		NIL
		(if (= (nth 3 (car (cdr (cdr board)))) value)
			NIL
			(if(= (nth 2 (car (cdr (cdr (cdr board))))) value)
				NIL
				(if(= (nth 3 (car (cdr (cdr (cdr board))))) value)
				 	NIL
					T))))
  
)

(defun checkSquares(board row column value)
	(if (and (< row 2) (< column 2)) ;if(row < 2 && column <2)
		(checkQuadrantOne board value)
		(if (and (< row 2) (>= column 2))
			(checkQuadrantTwo board value)
			(if (and (>= row 2) (< column 2))
				(checkQuadrantThree board value)
				(if (and (>= row 2) (>= column 2))
					(checkQuadrantFour board value)))))

)

(defun isValid(board row column value) ;checks row, column, square for the certain value. returns true if valid, nil otherwise
	(if (and (and (checkSquares board row column value) (checkColumn board column value)) (checkRow board row value))
		T
		NIL)
)
(defun for(iterations)
)

(defun sudokusolver(board)
	
)
