import java.util.*;
import java.io.*;

public class sudoku {
	

	public static void main(String [] args) {
		sudoku solver = new sudoku();
		int board[][] = {{1,2,0,0},{3,4,0,0},{0,0,4,0},{0,0,0,1}};	
		if(solver.solve(board)) {
			System.out.println("Printed solution");
		}
		else 
			System.out.println("Not valid board");
				
	}
	public boolean full(int[][] board) {
		for(int i = 0; i < 4; i++){
			for(int j = 0; j <4; j++) {
				if(board[i][j] == 0)
					return false;
			}
		}
		return true;

	}
	public boolean solve(int[][] board) {
		for(int i= 0; i< 4; i++) {
			for(int j =0; j<4; j++) {
				if(board[i][j] != 0) {
					continue;
				}
				for(int k = 1; k < 5; k++) {
					if(isValid(board, i, j, k)) {
						board[i][j] = k;
						if(solve(board))
							return true;
						else
							board[i][j] = 0;
					}
				}
				return false;
			}
		}
		for(int i = 0; i < 4; i++) {
			for(int j = 0; j < 4; j++) {
				System.out.print(board[i][j]);
			}
			System.out.println();
		}
		return true;
	}
	public boolean isValid(int[][] board, int row, int column, int value) {
		if(checkRows(board, row, value) && checkColumns(board, column, value) && checkSquares(board, row, column, value))
			return true;
		else
			return false;
	}
	public boolean checkRows(int[][] board, int row, int value) {
		for(int j = 0; j < 4; j++) {
			if(board[row][j] == value)
				return false;
		}
		return true;
	}
	public boolean checkColumns(int[][] board, int column, int value) {
		for(int i = 0; i < 4; i++) {
			if(board[i][column] == value)
				return false;
		}
		return true;
	}

	
	public boolean checkBox(int[][] board, int x, int y, int value) {
		for(int i = x; i < x+2; i++) {
			for(int j = y; j < y+2; j++) {
				if(board[i][j] == value)
					return false;
			}
		}
		return true;
	}
	public boolean checkSquares(int[][] board, int row, int column, int value) {
		if(row < 2 && column < 2) {
			if(checkBox(board, 0, 0, value))
				return true;
		}
		else if(row < 2 && column >= 2) {
			if(checkBox(board, 0, 2, value))
				return true;
		}
		else if(row >= 2 && column < 2) {
			if(checkBox(board, 2, 0, value))
				return true;
		}
		else if(row >= 2 && column >= 2) {
			if(checkBox(board, 2, 2, value))
				return true;
		}
		return false;
	}


}
