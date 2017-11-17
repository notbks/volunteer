package com.hck.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.hck.dao.FileDao;
import com.hck.struts.form.FileForm;

/**
 * Servlet implementation class downAction
 */
public class downAction extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String savepath = this.getServletContext().getRealPath("/WEB-INF/upload");
		int file_id = Integer.parseInt(request.getParameter("id"));
		FileForm form = FileDao.getfile(file_id);
		String path = savepath+"//"+form.getFile_name();  //真实路径
		String filename=URLEncoder.encode(form.getFile_name(),"utf-8");  //文件名
		response.setCharacterEncoding("utf-8");  
		response.setHeader("Content-Disposition","attachment; filename="+filename+"");  
		InputStream in = new FileInputStream(path);    //文件输入流
		OutputStream out = response.getOutputStream();	//输出流
		
		IOUtils.copy(in, out);
		in.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
