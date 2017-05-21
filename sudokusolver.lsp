(defun setrow(row i value) ;set a specific row value at i location to value this function was copied from stackoverflow
  	(if (> i 0)
	  	(cons (car row) (setrow (cdr row) (1- i) value))
		(cons value (cdr row)))
)

(defun setboard(board row column value) ;setting element at row,column to value this function was basically copied from stackoverflow
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


(defun tryValues (board row column value)
    (if (isValid board row column value)
      (conditionalReturn (sudokusolver(setboard board row column value)) ; iterate
          (if (< value 4) 
            (tryValues board row column (+ value 1))
            Nil ; If the last one then 4
          )
      )
      (if (< value 4) 
        (tryValues board row column (+ value 1))
        Nil ; If the last one then 4
      )
    )  
)

(defun conditionalReturn(a b)
    (if (equal a Nil)
        b
        a
    )  
)


(defun iterate (board x y)
  (if (equal (nth x (nth y board)) 0)
    (; attempt to insert into board
     tryValues board y x 1
    )
    (if (< x 3) ; Move to the next element
        (iterate board (+ x 1) y) ; Change col not row.
        (if (< y 3)
            (iterate board 0 (+ y 1))
            board
        )
    )
 )
)

(defun sudokusolver(board)
    (iterate board 0 0)
)

(defun formatSudoku(original solved)
  (if (equal solved Nil)
    (list Nil original)
    (list T solved)
  )
)

(defun sudoku-solver (board)
    (formatSudoku board (sudokusolver board))
)

;Testing
;(print (sudoku-solver '((3 0 1 0) (0 0 0 0) (0 0 0 0) (0 0 0 0))  ))
;(print (sudoku-solver '((1 2 0 0) (0 0 3 0) (0 0 0 0) (0 0 0 4))))
