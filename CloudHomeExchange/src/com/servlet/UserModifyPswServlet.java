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
import com.service.UserServiceImpl;
import com.util.MD5Utils;

/**
 * Servlet implementation class UserModifyPswServlet
 */
@WebServlet("/UserModifyPswServlet")
public class UserModifyPswServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyPswServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("send register servlet service");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cpsw = request.getParameter("cpsw");
		String npsw = request.getParameter("npsw");
		String renpsw = request.getParameter("renpsw");
		if (npsw.equals(renpsw)) {
			User user = new User();
			HttpSession session = request.getSession();
			user.setUid((String) session.getAttribute("userId"));
			user.setPsw(MD5Utils.md5(cpsw));
			UserService us = new UserService();
			boolean flag = us.validPsw(user);
			if(flag) {
				user.setPsw(MD5Utils.md5(npsw));
				boolean flag0 = us.modifyPsw(user);
				if(flag0) {
					response.getWriter().append("<script language='javascript'>alert('modify success');</script>");
					response.sendRedirect("myaccount/login.jsp" );
				}else {
					response.getWriter().append("<script language='javascript'>alert('fail to modify');"
							+ "history.back();</script>");
				}
			}else {
				response.getWriter().append("<script language='javascript'>alert('current password is wrong');"
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
