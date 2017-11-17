package com.hck.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.dao.VolunteerDao;
import com.hck.struts.form.VolunteerForm;

/**
 * Servlet implementation class personInfoAction
 */
@WebServlet("/personInfo")
public class personInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public personInfoAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); 
		//String name = request.getParameter("name");
		String gender = request.getParameter("sex");
		int age = 0;
		System.out.println("得到的age"+request.getParameter("age"));
		try{
			age = Integer.parseInt(request.getParameter("age"));
			System.out.println("之后的"+age);
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("erro", "年龄格式有误!");
			request.getRequestDispatcher("/zyz/view/PersonInfo.jsp").forward(request, response);
		}
		String record = request.getParameter("record");
		VolunteerForm form = (VolunteerForm) request.getSession().getAttribute("volunteer");
		form.setVolunteer_age(age);
		form.setVolunteer_gender(gender);
		form.setVolunteer_record(record);
		if(VolunteerDao.updateVolunteer(form)){
			response.getWriter().print("<script language='javascript'>alert('注册成功!!!'); window.location.href='/zyz/view/main.jsp';</script>");
		}else{
			request.setAttribute("erro", "更新信息失败请重试");
			request.getRequestDispatcher("/zyz/view/PersonInfo.jsp").forward(request, response);
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
