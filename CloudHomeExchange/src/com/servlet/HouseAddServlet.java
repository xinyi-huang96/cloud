package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.entity.House;
import com.service.HouseService;
import com.util.FileUpload;

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
		MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest req = resolver.resolveMultipart(request);
		System.out.println("house add servlet");
		req.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId");
		System.out.println("user:" + uid);
		String title = req.getParameter("title");
		String country = req.getParameter("country");
		String city = req.getParameter("city");
		String addr = req.getParameter("address");
		String detail = req.getParameter("describe");
		String[] feature = req.getParameterValues("feature");
		StringBuffer sb = new StringBuffer(1024);
		for(String fea:feature){
			System.out.println(fea);
			sb.append(fea + "|");
		} 
		//System.out.println("feature: " + sb.toString());
		String style = req.getParameter("style");
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
		int bedroom = Integer.parseInt(req.getParameter("bedroom"));
		int bathroom = Integer.parseInt(req.getParameter("bathroom"));
		int num = Integer.parseInt(req.getParameter("people"));
		MultipartFile photo = req.getFile("file");
		String filePath = new String();
		if(photo == null)
			filePath = null;
		else
			filePath = FileUpload.upload(photo, "d://upload/" + uid);
		System.out.println("file: " + filePath);
		House house = new House();
		house.setTitle(title);
		house.setDetail(detail);
		house.setFeatures(sb.toString());
		house.setStyle(styl);
		house.setBedrooms(bedroom);
		house.setBathrooms(bathroom);
		house.setPeopleNum(num);
		house.setCountry(country);
		house.setCity(city);
		house.setAddress(addr);
		house.setPhoto(filePath);
		if(uid != null) {
			HouseService hs = new HouseService();
			boolean flag = hs.add(house, uid);
			if(flag == true) {
				response.getWriter().append("<script language='javascript'>alert('Add house success.');</script>");
				response.sendRedirect("myhouse/index.jsp" );
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
