package com.hck.control;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.struts.form.NewsForm;
import com.hck.dao.*;

/**
 * Servlet implementation class prepareAction
 */
@WebServlet("/pre")
public class prepareAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public prepareAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("this is prepared!!!");
		ArrayList<NewsForm> list = (ArrayList<NewsForm>) NewsDao.getNewsList();
		request.getSession().setAttribute("list", list);
		for(NewsForm n:list){
			System.out.println(n.getNews_title());
		}
		request.getRequestDispatcher("view/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
