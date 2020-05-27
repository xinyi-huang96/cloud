package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.House;
import com.service.HouseService;

/**
 * Servlet implementation class HouseDeleteServlet
 */
@WebServlet("/HouseDeleteServlet")
public class HouseDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("house delete servlet");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String hid = request.getParameter("hid");
		House house = new House();
		house.setHid(hid);
		System.out.println("hid" + hid);
		if(hid != null) {
			HouseService hs = new HouseService();
			boolean flag = hs.delete(hid);
			if(flag == true) {
				response.getWriter().append("<script language='javascript'>alert('delete house success.');"
						+ "history.back();</script>");
			}else {
				response.getWriter().append("<script language='javascript'>alert('failed to delete house');"
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
