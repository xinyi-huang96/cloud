package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;
import com.service.UserServiceImpl;

/**
 * Servlet implementation class RegisterServlet
 * @param <HttpSession>
 */
@WebServlet("/RegisterServlet")
public class UserRegisterServlet<HttpSession> extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserRegisterServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("send register servlet service");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String email = request.getParameter("email");
		String psw = request.getParameter("psw");
		String repsw = request.getParameter("repsw");
		int gender = request.getParameter("sex").equals("male") ? 1 : 0;
		String birth = request.getParameter("birth");
		UserServiceImpl us=new UserServiceImpl();
		if (psw.equals(repsw)) {
			User user = new User();
			int info = us.register(email,psw,birth,gender);
			if(info == 1 ) {
				response.getWriter().append("<script language='javascript'>alert('register success');"
						+ "history.back();</script>");
				response.sendRedirect("myaccount/login.jsp" );
			}else if (info == 0) {
				response.getWriter().append("<script language='javascript'>alert('user existed');"
						+ "history.back();</script>");
			}else {
				response.getWriter().append("<script language='javascript'>alert('fail to register');"
						+ "history.back();</script>");
			}
		}else {
			response.getWriter().append("<script language='javascript'>alert('passwords are inconsistent');"
					+ "history.back();</script>");
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
