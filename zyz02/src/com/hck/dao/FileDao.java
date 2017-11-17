package com.hck.dao;
import java.util.ArrayList;
import com.hck.struts.form.*;

//import jdk.nashorn.internal.codegen.DumpBytecode;
public class FileDao {
	
	
	/**
	 * 获取所有文件信息
	 * @return
	 */
	public static ArrayList<FileForm> getFiles(){
		String sql = "select * from files";
		ArrayList<FileForm> list = JDBC.getResouceByReflection(FileForm.class, sql);
		return list;
	}
	
	/**
	 * 获取一个文件信息
	 * @param file_id
	 * @return
	 */
	public static FileForm getfile(int file_id){
		String sql = "select * from files where file_id = ?";
		FileForm form = JDBC.getObjectByReflection(FileForm.class, sql, file_id);
		return form;
	}
	
	public static boolean deleteFile(int file_id){
		String sql = "delete from files where file_id = ?";
		int res = JDBC.executeUpdate(sql, file_id);
		if(res > 0){
			return true;
		}
		return false;
	}
	
	/**
	 * 插入文件信息
	 * @param form
	 * @return
	 */
	public static boolean addFile(FileForm form){
		String sql = "insert into files(file_name,file_date) values(?,?)";
		int res = JDBC.executeUpdate(sql, form.getFile_name(),form.getFile_date());
		if(res > 0){
			return true;
		}
		return false;
	}
	
}
