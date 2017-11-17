package com.hck.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.dao.AdministratorDao;
import com.hck.dao.FileDao;
import com.hck.dao.NewsDao;
import com.hck.struts.form.AdministratorForm;
import com.hck.struts.form.FileForm;
import com.hck.struts.form.NewsForm;

/**
 * Servlet implementation class rootAction
 */

public class rootAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rootAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//AdministratorForm root = (AdministratorForm) request.getSession().getAttribute("root");
		ArrayList<AdministratorForm> rootList = AdministratorDao.getAdministratros();
		ArrayList<FileForm> fileList = FileDao.getFiles();
		ArrayList<NewsForm> newsList = (ArrayList<NewsForm>) NewsDao.getNewsList();
		
		
		request.getSession().setAttribute("rootlist", rootList);
		request.getSession().setAttribute("filelist", fileList);
		request.getSession().setAttribute("newslist", newsList);
		response.sendRedirect("/zyz/view/manager.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
