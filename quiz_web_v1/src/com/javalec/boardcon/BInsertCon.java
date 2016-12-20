package com.javalec.boardcon;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BInsertCon {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String f_board_id = request.getParameter("f_board_id");
		String f_board_title = request.getParameter("f_board_title");
		String f_board_Content = request.getParameter("f_board_Content");
		
		BDao dao = new BDao();
		dao.write(f_board_id, f_board_title, f_board_Content);
	}
}