package com.hck.dao;

import com.hck.struts.form.VolunteerForm;

public class VolunteerDao {

	/**
	 * 判断普通用户是否合法
	 * @param volunteer_id	用户提供的用户名
	 * @param volunteer_pwd	用户提供的用户密码
	 * @return	普通用户是否合法
	 */
	public static boolean VolunteerIsLeage(VolunteerForm form){
		String sql = "select * from volunteer where volunteer_name = ? and volunteer_pwd = ?";
		if( null != JDBC.getObjectByReflection(VolunteerForm.class, sql, form.getVolunteer_name(), form.getVolunteer_pwd())){
			return true;
		}
		return false;
	}
	

	/**
	 * 添加用户
	 * @param form	控制器提供的用户表单
	 * @return	添加用户是否成功
	 */
	public static boolean addVolunteer(VolunteerForm form){
		String sql = "insert into volunteer values(?,?,?,?,?,?)";
		int res = JDBC.executeUpdate(sql, form.getVolunteer_id(), form.getVolunteer_name(),
									form.getVolunteer_pwd(), form.getVolunteer_record(),
									form.getVolunteer_age(), form.getVolunteer_gender());
		if(res > 0){
			return true;
		}
		return false;
	}
	

	/**
	 * 更新用户
	 * @param form	控制器提供的新的用户表单
	 * @return	是否更新成功
	 */
	public static boolean updateVolunteer(VolunteerForm form){
		String sql = "replace into Volunteer values(?,?,?,?,?,?)";
		int res = JDBC.executeUpdate(sql, form.getVolunteer_id(), form.getVolunteer_name(),
									form.getVolunteer_pwd(), form.getVolunteer_record(), 
									form.getVolunteer_age(), form.getVolunteer_gender());
		if(res > 0){
			return true;
		}
		return false;
	}
	

	/**
	 * 删除用户
	 * @param volunteer_id 控制器提供的需要删除的用户id
	 * @return	是否删除成功
	 */
	public static boolean deleteVolunteer(int volunteer_id){
		String sql = "delete from Volunteer where volunteer_id = ?";
		int res = JDBC.executeUpdate(sql, volunteer_id);
		if(res > 0){
			return true;
		}
		return false;
	}
	/**
	 * 验证是否已存在用户名
	 * @param form
	 * @return
	 */
	public static boolean quicklyRegister(VolunteerForm form){
		String sql = "insert into volunteer(volunteer_name,volunteer_pwd) values(?,?)";
		int res = JDBC.executeUpdate(sql, form.getVolunteer_name(), form.getVolunteer_pwd());
		if(res > 0){
			return true;
		}
		return false;
	}
	
	
}
