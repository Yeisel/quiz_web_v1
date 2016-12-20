package com.javalec.boardcon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BReadCon {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String idx = request.getParameter("idx");
		BDao dao = new BDao();
		BDto dto = dao.Read(idx);
		
		
		request.setAttribute("Read", dto);
	}
}