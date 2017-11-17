package com.hck.dao;

import java.util.ArrayList;

import com.hck.struts.form.AdministratorForm;

public class AdministratorDao {
	/**
	 * 判断管理员登陆是否合法
	 * @param admin_id	用户提供的管理员id
	 * @param admin_pwd 用户提供的管理员密码
	 * @return	管理员是否合法
	 */
	public static boolean AdministratorIsLeage(AdministratorForm form){
		String sql = "select * from administrator where admin_name = ? and admin_pwd = ?";
		AdministratorForm admin = JDBC.getObjectByReflection(AdministratorForm.class, sql, form.getAdmin_id(), form.getAdmin_pwd());
		if(null != admin) {
			return true;
		}
		return false;
	}
	

	/**
	 * 添加管理员
	 * @param form	控制器提供的管理员表单
	 * @return	添加管理员是否成功
	 */
	public static boolean addAdministrator(AdministratorForm form){
		String sql = "insert into Administrator(admin_name,admin_pwd) values(?,?)";
		int res = JDBC.executeUpdate(sql, form.getAdmin_name(),
											form.getAdmin_pwd());
		if(res > 0 ){
			return true;
		}
		return false;
	}
	

	/**
	 * 更新管理员
	 * @param form	控制器提供的新的管理员表单
	 * @return	是否更新成功
	 */
	public static boolean updateAdministrator(AdministratorForm form){
		String sql = "replace into Administrator values(?,?,?)";
		int res = JDBC.executeUpdate(sql, form.getAdmin_id(), form.getAdmin_name(), 
											form.getAdmin_pwd());
		if(res > 0){
			return true;
		}
		return false;
	}
	

	/**
	 * 删除管理员
	 * @param admin_id 控制器提供的需要删除的管理员id
	 * @return	是否删除成功
	 */
	public static boolean deleteAdministrator(int admin_id){
		String sql = "delete from Administrator where admin_id = ?";
		int res = JDBC.executeUpdate(sql, admin_id);
		if(res > 0){
			return true;
		}
		return false;
	}
	

	/**
	 * 获取所有管理员
	 * @return
	 */
	public static ArrayList<AdministratorForm> getAdministratros(){
		String sql = "select * from administrator";
		ArrayList<AdministratorForm> list = JDBC.getResouceByReflection(AdministratorForm.class, sql);
		return list;
	}
	
}
