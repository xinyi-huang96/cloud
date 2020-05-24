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
 * Servlet implementation class HouseAddServlet
 */
@WebServlet("/HouseAddServlet")
public class HouseAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("house add servlet");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String title = request.getParameter("title");
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String addr = request.getParameter("address");
		String detail = request.getParameter("discribe");
		String feature = request.getParameter("feature");
		System.out.println("feature: " + feature);
		String style = request.getParameter("style");
		int styl = 0;
		if(style.equals("CityPad")) {
			styl = 1;
		}else if(style.equals("ByTheSea")) {
			styl = 2;
		}else if(style.equals("Countryside")) {
			styl = 3;
		}else if(style.equals("Mountain")) {
			styl = 4;
		}else if(style.equals("SpringWater")) {
			styl = 5;
		}
		int bedroom = Integer.parseInt(request.getParameter("bedroom"));
		int bathroom = Integer.parseInt(request.getParameter("bathroom"));
		int num = Integer.parseInt(request.getParameter("number"));
		String photo = "path";
		House house = new House();
		house.setTitle(title);
		house.setDetail(detail);
		house.setFeatures(feature);
		house.setStyle(styl);
		house.setBedrooms(bedroom);
		house.setBathrooms(bathroom);
		house.setPeopleNum(num);
		house.setCountry(country);
		house.setCity(city);
		house.setAddress(addr);
		house.setPhoto(photo);
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId");
		if(uid != null) {
			HouseService hs = new HouseService();
			boolean flag = hs.add(house, uid);
			if(flag == true) {
				response.getWriter().append("<script language='javascript'>alert('Add house success.');"
						+ "history.back();</script>");
			}else {
				response.getWriter().append("<script language='javascript'>alert('failed to add house');"
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
