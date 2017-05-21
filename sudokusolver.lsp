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



(defun for(iterations)
)

(defun sudokusolver(board)
	
)
