package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.House;
import com.service.HouseService;

/**
 * Servlet implementation class HouseSearchServlet
 */
@WebServlet("/HouseSearchServlet")
public class HouseSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet search house start");
		StringBuffer sb = new StringBuffer(1024);
		String city = request.getParameter("depart");
		String checkIn = request.getParameter("indate");
		String checkOut = request.getParameter("outdate");
		String number = request.getParameter("number");
		String[] feature = request.getParameterValues("feature");
		if (city != null && !"".equals(city)) {
			sb.append(" AND Addr_city like '%" + city + "%'");
		}
		if(number != null && !"".equals(number)) {
			int sleeping = Integer.parseInt(number);
			sb.append(" AND PeoplNum >= " + sleeping + " ");
		}
		if(checkIn != null && !"".equals(checkIn)) {
			if(checkOut != null && !"".equals(checkOut)) {
				sb.append(" AND Hid NOT IN ( " + 
						"	SELECT Hid FROM orderhouse " + 
						"	WHERE checkin <= " +  checkIn +
						"	AND checkout > " + checkOut + ")");
			}else {
				sb.append(" AND Hid NOT IN ( " + 
						"	SELECT Hid FROM orderhouse " + 
						"	WHERE checkin <= " +  checkIn +
						"	AND checkout > " + checkIn + ")");
			}
		}
		if(feature != null && !"".equals(feature)) {
			StringBuffer sbu = new StringBuffer(1024);
			for(String fea:feature){
				System.out.println(fea);
				sbu.append(fea + "|");
			} 
			String features = sbu.toString();
			features = features.substring(0, features.length() - 1);
			 sb.append("features REGEXP " + features);
		}
		HouseService hs = new HouseService();
		int totalCount = hs.getHouseCount(sb.toString());
		if(totalCount == 0) {
			response.getWriter().append("<script language='javascript'>alert('0 result'); history.back();</script>");
		}else {
			List<House> houseList = hs.search(sb.toString());
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("houseList", houseList);
			request.getRequestDispatcher("./searching/searchhouse.jsp").forward(request, response);
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
