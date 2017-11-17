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
 * Servlet implementation class registerAction
 */
@WebServlet("/register")
public class registerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		VolunteerForm form = new VolunteerForm();
		form.setVolunteer_name(name);
		form.setVolunteer_pwd(pwd);
		
		if (VolunteerDao.quicklyRegister(form)) {
			// 跳转到完善信息页面
			request.getSession().setAttribute("volunteer", form);
			request.getRequestDispatcher("view/PersonInfo.jsp").forward(request, response);
		} else {
			request.setAttribute("erro", "该用户已存在");
			request.getRequestDispatcher("view/register.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
