package com.firstclass.board0.dto.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstclass.board0.dao.BDao;
import com.firstclass.board0.dto.BDto;


public class BReadCon {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String idx = request.getParameter("idx");
		BDao dao = new BDao();
		BDto dto = dao.Read(idx);
		
		
		request.setAttribute("Read", dto);
	}
}