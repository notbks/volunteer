package com.hck.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hck.dao.AdministratorDao;
import com.hck.dao.VolunteerDao;
import com.hck.struts.form.AdministratorForm;
import com.hck.struts.form.LoginForm;
import com.hck.struts.form.VolunteerForm;

/**
 * Servlet implementation class loginAction
 */
@WebServlet("/login")
public class loginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login_name = request.getParameter("name");
		String login_pwd = request.getParameter("pwd");
		String[] login_root = request.getParameterValues("checkbox");
		
		LoginForm loginForm = new LoginForm();
		loginForm.setName(login_name);
		loginForm.setPwd(login_pwd);
		if(null!=login_root){
			loginForm.setRoot(true);
		}
		System.out.println(loginForm);
		if(loginForm.isRoot()){
			//验证管理员是否合法
			AdministratorForm admin_form = new AdministratorForm();
			admin_form.setAdmin_name(loginForm.getName());
			admin_form.setAdmin_pwd(loginForm.getPwd());
			if(AdministratorDao.AdministratorIsLeage(admin_form)){
				//这里跳转到管理页面
				request.getSession().setAttribute("root", admin_form);
				response.sendRedirect("/zyz/root");
			}else{
				//如果用户非法跳回登陆页面
				request.setAttribute("erro", "账号或密码错误");
				request.getRequestDispatcher("view/login.jsp").forward(request, response);
				
			}
		}else{
			//验证用户是否合法
			VolunteerForm volunteer_form = new VolunteerForm();
			volunteer_form.setVolunteer_name(loginForm.getName());
			volunteer_form.setVolunteer_pwd(loginForm.getPwd());
			if(VolunteerDao.VolunteerIsLeage(volunteer_form)){
				/**
				 * 把登陆的	用户姓名		放入session中
				 * 为了过滤器
				 */
				request.getSession().setAttribute("user", volunteer_form.getVolunteer_name());
				
				//这里跳转到主页面
				request.getSession().setAttribute("volunteer", volunteer_form);
				response.sendRedirect("/zyz/view/main.jsp");
			}else{
				//如果用户非法跳回登陆页面
				request.setAttribute("erro", "账号或密码错误");
				request.getRequestDispatcher("view/login.jsp").forward(request, response);
			}
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
