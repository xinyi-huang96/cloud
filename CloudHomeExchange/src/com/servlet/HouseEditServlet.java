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
 * Servlet implementation class HouseEditServlet
 */
@WebServlet("/HouseEditServlet")
public class HouseEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest req = resolver.resolveMultipart(request);
		System.out.println("house edit servlet");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String hid = req.getParameter("hid");
		String title = req.getParameter("title");
		String country = req.getParameter("country");
		String city = req.getParameter("city");
		String addr = req.getParameter("address");
		String detail = req.getParameter("discribe");
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
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("userId");
		MultipartFile photo = req.getFile("file");
		String path = "d:/upload/" + uid;
		System.out.println("path: " + path);
		String filePath = FileUpload.upload(photo, path);
		System.out.println("file: " + filePath);
		House house = new House();
		house.setHid(hid);
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
		HouseService hs = new HouseService();
		boolean flag = hs.edit(house);
		if(flag == true) {
			response.getWriter().append("<script language='javascript'>alert('edit house success.');</script>");
			response.sendRedirect("myhouse/index.jsp" );
		}else {
			response.getWriter().append("<script language='javascript'>alert('failed to edit house');"
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
