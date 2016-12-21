package com.javalec.boardcon;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BDeleteCon {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		BDao dao = new BDao();
		dao.delete(id);
	}
}