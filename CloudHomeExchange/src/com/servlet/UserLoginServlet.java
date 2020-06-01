package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.service.UserService;
import com.util.MD5Utils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;

    /**
     * Default constructor. 
     */
    public UserLoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("send login servlet service");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String email = request.getParameter("email");
		String password = request.getParameter("psw");
		UserService us = new UserService();
		User user = new User();
		user.setEmail(email);
		user.setPsw(MD5Utils.md5(password));
		int flag = us.login(user);
		if(flag == 4) {	//login success
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getUid());
			session.setAttribute("userNickName", user.getNickName());
			if(user.getType() == 0)
				response.sendRedirect("index.jsp" );
			else
				response.sendRedirect("index-background.jsp" );
		}else if(flag == -1) {	//user not exist
			response.getWriter().append("<script language='javascript'>alert('User does not exist.');"
					+ "history.back();</script>");
		}else if(flag == 3) {	//account blocked
			response.getWriter().append("<script language='javascript'>alert('Your account is blocked.');"
					+ "history.back();</script>");
		}else {	//wrong password
			response.getWriter().append("<script language='javascript'>alert('Your password is wrong. You have "
					+ flag + " times to try.'); history.back();</script>");
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
