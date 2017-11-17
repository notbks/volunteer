package com.hck.control;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.dao.AdministratorDao;
import com.hck.struts.form.AdministratorForm;

/**
 * Servlet implementation class addAdminAction
 */
public class addAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		AdministratorForm form = new AdministratorForm();
		response.setContentType("text/html;charset=utf-8");
		form.setAdmin_name(name);
		form.setAdmin_pwd(pwd);
		if(AdministratorDao.addAdministrator(form)){
			String str = "<!DOCTYPE html><html><script language='JavaScript' type='text/javascript'>"
					+ "alert('添加成功');"
					+ "window.location.href='/zyz/view/manager.jsp';"
					+ "</script></html>";
			response.getWriter().print(str);
			request.getRequestDispatcher("/root").forward(request, response);
		}else{
			String str = "<!DOCTYPE html><html><script language='JavaScript' type='text/javascript'>"
					+ "alert('添加失败');"
					+ "window.location.href='/zyz/view/manager.jsp';"
					+ "</script></html>";
			response.getWriter().print(str);
			request.getRequestDispatcher("/root").forward(request, response);
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
