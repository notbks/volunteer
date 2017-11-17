package com.hck.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.dao.NewsDao;
import com.hck.struts.form.NewsForm;

/**
 * Servlet implementation class addNews
 */
@WebServlet("/addNews")
public class addNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		NewsForm form = new NewsForm();
		response.setContentType("text/html;charset=utf-8");
		form.setNews_title(title);;
		form.setNews_content(content);;
		if(NewsDao.addNews(form)){
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
