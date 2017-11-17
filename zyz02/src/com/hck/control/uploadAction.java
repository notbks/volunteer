package com.hck.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.hck.dao.FileDao;
import com.hck.struts.form.FileForm;
//import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;

/**
 * Servlet implementation class uploadAction
 */
@WebServlet("/upload")
public class uploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String[] legal = { ".docx", ".doc", ".mp4", ".xls", ".xlsx" }; //允许上传的文件类型

	int MAX_SIZE = 300 * 1024 * 1024; // 30M

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//将文件保存到这个路径
		String savepath = this.getServletContext().getRealPath("/WEB-INF/upload");
		File file = new File(savepath);
		
		String message = null;
		//确定这个文件夹存在
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savepath + "目录不存在！已自动创建");
			file.mkdir();
		}
		
		DiskFileItemFactory fctory = new DiskFileItemFactory();
		ServletFileUpload fileuplaod = new ServletFileUpload(fctory);
		System.out.println("创建fileupload类");
		try {
			//上传表单的文件放入list中
			List<FileItem> list = fileuplaod.parseRequest(request);
			System.out.println("遍历是否存在文件上传的类型");
			System.out.println(list.size());
			for (FileItem fileItem : list) {
				System.out.println(fileItem);
			}
			for (FileItem item : list) {
				if (!item.isFormField()) {

					if (item.getSize() > MAX_SIZE) {
						message = "文件过大请重新选择";
					}else if(item.equals(null)) {
						message ="请选择文件！";
						
					}else {
						System.out.println("处理文件名");
						String filename = item.getName();
						System.out.println("filename:" + filename);
						String offname = filename.substring(filename.lastIndexOf('.'), filename.length());
						System.out.println("文件后缀:" + offname);
						for (String str : legal) {
							if (!str.equals(offname)) {
								message = "文件类型有误";
							} else {
								System.out.println("输入文件");
								File uploadfile = new File(file + "//" + filename);
								System.out.println(uploadfile.getAbsolutePath());
								InputStream in = item.getInputStream();
								OutputStream out = new FileOutputStream(uploadfile);
								IOUtils.copy(in, out);
								message = "上传成功！";
								in.close();
								out.close();
								FileForm form = new FileForm ();
								form.setFile_name(filename);
								form.setFile_date(new Date(System.currentTimeMillis()));
								FileDao.addFile(form);
							}
						}
					}
				}
			}
		} catch (FileUploadException e) {
			message = "上传失败";
			e.printStackTrace();
			response.sendRedirect("/zyz/root");
		} finally {
			request.setAttribute("message", message);
			response.sendRedirect("/zyz/root");
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
