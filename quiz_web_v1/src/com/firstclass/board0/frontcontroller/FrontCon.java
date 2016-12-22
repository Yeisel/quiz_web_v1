package com.firstclass.board0.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstclass.board0.dto.command.BDeleteCon;
import com.firstclass.board0.dto.command.BInsertCon;
import com.firstclass.board0.dto.command.BListCon;
import com.firstclass.board0.dto.command.BModifyCon;
import com.firstclass.board0.dto.command.BReadCon;
import com.firstclass.board0.dto.command.BUpdateCon;


/**
 * Servlet implementation class FrontCon
 */
@WebServlet("*.do")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontCon() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("actionDo");

		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		BListCon listcon = null;
		BReadCon readcon = null;
		BInsertCon insertcon = null;
		BDeleteCon deletecon = null;
		BModifyCon modifycon = null;
		BUpdateCon updatecon = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);

		if(com.equals("/board/board_list.do")) {
			listcon = new BListCon();
			listcon.execute(request, response);
			viewPage = "board_list.jsp";
		}

		else if(com.equals("/board/board_read.do")) {
			readcon = new BReadCon();
			readcon.execute(request, response);
			viewPage = "board_read.jsp";
		}

		else if(com.equals("/board/board_modify_view.do")) {
			modifycon = new BModifyCon();
			modifycon.execute(request, response);
			viewPage = "board_modify.jsp";
		}
		
		else if(com.equals("/board/board_modify_update.do")) {
			updatecon = new BUpdateCon();
			
			int result = updatecon.execute(request, response);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result);
			
			return;
		}
		
		
		else if(com.equals("/board/board_insert.do")) {
			insertcon = new BInsertCon();
			int result = insertcon.execute(request, response);
			
			response.setContentType("application/json");
			//response.setContentType("text/html; charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result);
			
			return;
		}  

		else if(com.equals("/board/board_delete.do")) {
			deletecon = new BDeleteCon();
			deletecon.execute(request, response);
			viewPage = "board_list.do";
		}


		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}

}
