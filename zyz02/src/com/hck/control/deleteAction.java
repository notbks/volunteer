package com.hck.control;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.dao.FileDao;
import com.hck.struts.form.FileForm;

/**
 * Servlet implementation class deleteAction
 */
public class deleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int file_id = Integer.parseInt(request.getParameter("id"));
		FileForm form = FileDao.getfile(file_id);
		response.setContentType("text/html;charset=utf-8");
		if(FileDao.deleteFile(file_id)){
			String savepath = this.getServletContext().getRealPath("/WEB-INF/upload");
			String realpath = savepath+"//"+form.getFile_name();
			File file = new File(realpath);
			if(file.exists()){
				file.delete();
			}
			String str = "<!DOCTYPE html><html><script language='JavaScript' type='text/javascript'>"
					+ "alert('删除成功');"
					+ "window.location.href='/zyz/view/manager.jsp';"
					+ "</script></html>";
			response.getWriter().print(str);
		}else{
			String str = "<!DOCTYPE html><html><script language='JavaScript' type='text/javascript'>"
					+ "alert('删除失败');"
					+ "window.location.href='/zyz/view/manager.jsp';"
					+ "</script></html>";
			response.getWriter().print(str);
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
