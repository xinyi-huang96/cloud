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

import com.entity.Message;
import com.service.MessageService;

/**
 * Servlet implementation class MsgSendServlet
 */
@WebServlet("/MsgSendServlet")
public class MsgSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("send message servlet service");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String sender = (String) session.getAttribute("userId");
		String receiver = request.getParameter("receiver");
		String content = request.getParameter("content");
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = dateFormat.format(now);
		Message msg = new Message();
		msg.setSender(sender);
		msg.setReceiver(receiver);
		msg.setType(2);
		msg.setContent(content);
		msg.setSendTime(time);
		MessageService ms = new MessageService();
		boolean flag = ms.sendMessage(msg);
		if(flag == true) {
			response.getWriter().append("<script language='javascript'>alert('send message success.');"
					+ "history.go(-2)</script>");
		}else {
			response.getWriter().append("<script language='javascript'>alert('failed to send message');"
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
