package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.User;
import com.service.UserService;

/**
 * Servlet implementation class UserBlockServlet
 */
@WebServlet("/UserBlockServlet")
public class UserBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBlockServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("user block servlet");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String uid = request.getParameter("uid");
		User user = new User();
		user.setUid(uid);
		System.out.println("uid" + uid);
		if(uid != null) {
			UserService us = new UserService();
			boolean flag = us.block(user);
			if(flag == true) {
				response.getWriter().append("<script language='javascript'>alert('block user success.');</script>");
				response.sendRedirect("background/user.jsp" );
			}else {
				response.getWriter().append("<script language='javascript'>alert('failed to block user');"
						+ "history.back();</script>");
			}
		}else {
			response.getWriter().append("<script language='javascript'>alert('error');"
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
