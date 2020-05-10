package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;

/**
 * Servlet implementation class UpdateUserInfoServlet
 */
@WebServlet("/UpdateUserInfoServlet")
public class UpdateUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("send update user info servlet service");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
//		HttpSession session = request.getSession();
//		String uid = (String)session.getAttribute("userId");
		String uid = "123456";
		String nickName = request.getParameter("firstname");
		int gender = request.getParameter("sex").equals("male") ? 1 : 0;
		String birth = request.getParameter("birthday");
		String email = request.getParameter("email");
		int tel = Integer.parseInt(request.getParameter("tel"));
		User user = new User(uid, nickName, gender, birth, email, tel);
		UserService us=new UserService();
		if(us.update(user)) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("failed");
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
