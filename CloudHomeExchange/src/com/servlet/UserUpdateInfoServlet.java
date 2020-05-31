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

/**
 * Servlet implementation class UpdateUserInfoServlet
 */
@WebServlet("/UserUpdateInfoServlet")
public class UserUpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 3L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateInfoServlet() {
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
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("userId");
		String nickName = request.getParameter("firstname");
		int gender = request.getParameter("sex").equals("male") ? 1 : 0;
		String birth = request.getParameter("birthday");
		String email = request.getParameter("email");
		int tel = Integer.parseInt(request.getParameter("tel"));
		System.out.println(tel);
		User user = new User(uid, nickName, gender, birth, email, tel);
		UserService us=new UserService();
		if(us.update(user)) {
			response.getWriter().append("<script language='javascript'>alert('modify success');</script>");
			response.sendRedirect("/myaccount/myprofile.jsp");
		}else {
			response.getWriter().append("<script language='javascript'>alert('fail to modify');"
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
