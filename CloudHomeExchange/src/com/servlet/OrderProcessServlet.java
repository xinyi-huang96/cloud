package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Order;
import com.service.OrderService;

/**
 * Servlet implementation class OrderProcessServlet
 */
@WebServlet("/OrderProcessServlet")
public class OrderProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 4L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("send order process servlet service");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String oid = request.getParameter("oid");
		String comment = request.getParameter("comment");
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = dateFormat.format(now);
		int state = 0;
		Order order = new Order();
		order.setOid(oid);
		order.setOperTime(time);
		order.setState(state);
		order.setOperComment(comment);
		OrderService os = new OrderService();
		boolean flag = os.updateOrderState(order);
		if(flag) {
			response.getWriter().append("<script language='javascript'>alert('accept order success');"
					+ "history.back();</script>");
			response.getWriter().append("<script language='javascript'>alert('refuse order success');"
					+ "history.back();</script>");
		}else {
			response.getWriter().append("<script language='javascript'>alert('fail to oper');"
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
