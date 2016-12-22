package com.firstclass.board0.dto.command;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstclass.board0.dao.BDao;


public class BUpdateCon {

	public int execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String idx = request.getParameter("idx");
		String f_board_id = request.getParameter("f_board_id");
		String f_board_title = request.getParameter("f_board_title");
		String f_board_content = request.getParameter("f_board_content");
		BDao dao = new BDao();
		
		System.out.println("나와라" +f_board_id);
		System.out.println("나와라" +f_board_title);
		System.out.println("나와라" +f_board_content);
		
		
		return dao.update(f_board_id, f_board_title, f_board_content, idx);
	}
}