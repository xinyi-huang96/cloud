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
 * Servlet implementation class OrderCreateServlet
 */
@WebServlet("/OrderCreateServlet")
public class OrderCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 3L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCreateServlet() {
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
		String hid = request.getParameter("hid");
		String applicant = request.getParameter("uid");
		String checkIn = request.getParameter("checkin");
		String checkOut = request.getParameter("checkout");
		String comment = request.getParameter("comment");
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String time = dateFormat.format(now);
		Order order = new Order();
		order.setHid(hid);
		order.setApplicant(applicant);
		order.setCheckIn(checkIn);
		order.setCheckOut(checkOut);
		order.setComment(comment);
		order.setOperTime(time);
		order.setOperComment(comment);
		OrderService os = new OrderService();
		boolean flag = os.addOrder(order);
		if(flag) {
			response.getWriter().append("<script language='javascript'>alert('create order success');"
					+ "history.back();</script>");
		}else {
			response.getWriter().append("<script language='javascript'>alert('fail to create order');"
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
