import java.util.*;
import java.io.*;

public class sudoku {
	

	public static void main(String [] args) {
		sudoku solver = new sudoku();
		int board[][] = {{1,2,0,0},{4,3,0,0},{0,0,4,0},{0,0,0,1}};	
		if(solver.isValid(board)) {
			System.out.println("valid board");
		}
		else 
			System.out.println("not valid board");
				
	}
	public boolean solve(int[][] board) {
		return true;
	}
	public boolean isValid(int[][] board) {
		if(checkRows(board) && checkColumns(board) && checkSquares(board))
			return true;
		else
			return false;
	}
	public boolean checkRows(int[][] board) {
		boolean one = true;
		boolean two = true;
		boolean three = true;
		boolean four = true;
		for(int i = 0; i < 4; i++) {
			for(int j = 0; j < 4; j++) {
				if(board[i][j] == 0)
					continue;
				else if(board[i][j] == 1 && one)
					one = false;
				else if(board[i][j] == 2 && two)
					two = false;
				else if(board[i][j] == 3 && three)
					three = false;
				else if(board[i][j] == 4 && four)
					four = false;
				else
					return false;
			}
			one = true;
			two = true;
			three = true;
			four = true;
		}
		return true;
	}
	public boolean checkColumns(int[][] board) {
		boolean one = true;
		boolean two = true;
		boolean three = true;
		boolean four = true;
		for(int i = 0; i < 4; i++) {
			for(int j = 0; j < 4; j++) {
				if(board[j][i] == 0)
					continue;
				else if(board[j][i] == 1 && one)
					one = false;
				else if(board[j][i] == 2 && two)
					two = false;
				else if(board[j][i] == 3 && three)
					three = false;
				else if(board[j][i] == 4 && four)
					four = false;
				else
					return false;
			}
			one = true;
			two = true;
			three = true;
			four = true;
		}
		return true;
	}

	
	public boolean checkBox(int[][] board, int x, int y) {
		boolean one = true;
		boolean two = true;
		boolean three = true;
		boolean four = true;
		for(int i = x; i < x+2; i++) {
			for(int j = y; j < y+2; j++) {
				if(board[i][j] == 0)
					continue;
				else if(board[i][j] == 1 && one)
					one = false;
				else if(board[i][j] == 2 && two)
					two = false;
				else if(board[i][j] == 3 && three)
					three = false;
				else if(board[i][j] == 4 && four)
					four = false;
				else
					return false;
			}
		}
		return true;
	}
	public boolean checkSquares(int[][] board) {
		if(checkBox(board, 0,0) && checkBox(board, 0,2) && checkBox(board,2,0) && checkBox(board,2,2))
				return true;
		else
			return false;
	}


}
