package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Order;
import com.service.OrderService;

/**
 * Servlet implementation class CommentAddServlet
 */
@WebServlet("/CommentAddServlet")
public class CommentAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("add comment servlet service");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String oid = request.getParameter("oid");
		String hid = request.getParameter("hid");
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId");
		int score = Integer.parseInt(request.getParameter("score"));
		String comment = request.getParameter("comment");
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = dateFormat.format(now);
		Order order = new Order();
		order.setOid(oid);
		order.setHid(hid);
		order.setApplicant(uid);
		order.setScore(score);
		order.setComment(comment);
		order.setOperTime(time);
		OrderService os = new OrderService();
		boolean flag = os.addOrderComment(order);
		if(flag == true) {
			response.getWriter().append("<script language='javascript'>alert('add comment success.');</script>");
			response.sendRedirect("myapply/index_history.jsp" );
		}else {
			response.getWriter().append("<script language='javascript'>alert('failed to add comment');"
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
