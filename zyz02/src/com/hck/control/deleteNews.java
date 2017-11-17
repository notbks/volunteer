package com.hck.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.dao.NewsDao;

/**
 * Servlet implementation class deleteNews
 */
@WebServlet("/deleteNews")
public class deleteNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteNews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int news_id = Integer.parseInt(request.getParameter("id"));
		if(NewsDao.deleteNews(news_id)){
			String str = "<!DOCTYPE html><html><script language='JavaScript' type='text/javascript'>"
					+ "alert('删除成功');"
					+ "window.location.href='/zyz/view/manager.jsp';"
					+ "</script></html>";
			response.getWriter().print(str);
			response.sendRedirect("/zyz/root");
		}else{
			String str = "<!DOCTYPE html><html><script language='JavaScript' type='text/javascript'>"
					+ "alert('删除失败');"
					+ "window.location.href='/zyz/view/manager.jsp';"
					+ "</script></html>";
			response.getWriter().print(str);
			response.sendRedirect("/zyz/root");
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
