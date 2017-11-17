package com.hck.dao;

import com.mysql.jdbc.Connection;
import java.lang.reflect.*;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
/**
 * JDBC工具类,可以获取链接，执行sql操作得到结果集，或者一个javabean对象，或者一个javabean对象的list。可以关闭关于数据库的资源
 * @author hck
 */
public class JDBC {
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	private static ResultSetMetaData rsmd= null;
	private static Properties info = null;
	private static String url = null;
	/*
	 * 加载配置文件
	 */
	static{
		info = new Properties();
		try {
			//read
			info.load(JDBC.class.getClassLoader().getResourceAsStream("jdbc.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		url = info.getProperty("jdbcUrl");
	}

	/**
	 * 获取链接
	 * @return 
	 */
	public static Connection getConnection() {
		try {
			conn = (Connection) DriverManager.getConnection(url, info);
			System.out.println(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 执行一个sql操作
	 * @param sql sql语句like：select * from user where id = ?;
	 * @param arg  需要填sql语句问号的值
	 * @return 一个结果集(ResultSet)
	 */
	public static  ResultSet executeQuery(String sql, Object... arg) {
		conn = getConnection();
		try {
			ps = conn.prepareStatement(sql);
			if(arg != null){
				for (int i = 0; i < arg.length; i++) {
					ps.setObject(i + 1, arg[i]);  //PrepareStatement 的下标是从1开始
				}
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 *  
	 * @param sql
	 * @param arg
	 * @return
	 * @throws Exception
	 */
	public static int executeUpdate (String sql, Object... arg) {
		conn = getConnection();
		try {
			ps = conn.prepareStatement(sql);
			if(arg != null){
				for (int i = 0; i < arg.length; i++) {
					ps.setObject(i + 1, arg[i]);
				}
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn, ps, rs);
		}
		return 0;
	}
	/**
	 * 得到一个与数据表对应JavaBean对象
	 * 例: sql语句为:select * from users where id = ? 可以得到一个与user表对应的user对象
	 * @param clazz 所需JavaBean的class 对象
	 * @param sql	执行的sql语句
	 * @param arg	填充sql语句的值
	 * @return 所需对象
	 */
	public static <T> T getObjectByReflection(Class<T> clazz, String sql, Object... arg){
		conn = getConnection();
		T entity = null; 
		try {
			ps = conn.prepareStatement(sql);
			if(arg != null){
				for (int i = 0; i < arg.length; i++) {
					ps.setObject(i + 1, arg[i]);
				}
			}
			rs = ps.executeQuery();
			rsmd = rs.getMetaData(); //得到结果集关于列的描述
			while(rs.next()){
				entity = clazz.newInstance(); //反射创建所需的对象
				for(int i = 0; i < rsmd.getColumnCount(); i++){
					String columnName = rsmd.getColumnName(i+1); //得到这一列的列的名字 注意：列名必须和Javabean的属性名相同，否则会报错
					Field filed = clazz.getDeclaredField(columnName);//通过class对象得到域对象，如果是getFiled();不能获取私有方法
					filed.setAccessible(true); //确保能够调用私有设置方法
					filed.set(entity, rs.getObject(columnName)); 
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, ps, rs);
		}
		return entity;
	}
	/**
	 * 得到一个与数据表对应JavaBean对象集合//例: sql语句为:select * from users 可以得到整个user表的数据并封装成一个userlist
	 * @param clazz 所需JavaBean的class 对象
	 * @param sql	执行的sql语句
	 * @param arg	填充sql语句的值
	 * @return 所需对象的集合
	 */
	public static <T> ArrayList<T> getResouceByReflection(Class<T> clazz, String sql, Object... arg) {
		conn = getConnection(); 
		ArrayList<T> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql); 
			if(arg != null){
				for (int i = 0; i < arg.length; i++) {
					ps.setObject(i + 1, arg[i]);
				}
			}
			
			rs = ps.executeQuery();
			rsmd = rs.getMetaData(); 
			
			while(rs.next()){
				Map<String, Object> map = new HashMap<String, Object>();//接收一条数据
				
				for(int i = 0; i < rsmd.getColumnCount(); i++){
					String colunmName= rsmd.getColumnName(i+1);
					map.put(colunmName, rs.getObject(colunmName));//将每一条数据按<列名，列值>放入HashMap
				}
				
				T entity = clazz.newInstance();//通过反射创建所需的对象
			
				for(Map.Entry<String, Object> entry : map.entrySet()){
					Field field = entity.getClass().getDeclaredField(entry.getKey());//通过class对象得到域对象，如果是getFiled();不能获取私有方法
					field.setAccessible(true); //确保能够调用私有设置方法
					field.set(entity, entry.getValue()); 
				}
				list.add(entity); //将一个封装好的对象放入list中
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, ps, rs);
		}
		
		return list;
	}

	public Connection getConn() {
		return conn;
	}

	public PreparedStatement getPs() {
		return ps;
	}

	public ResultSet getRs() {
		return rs;
	}

	public JDBC(){
		System.out.println("A JDBCTOOL!!!");
	}
	/**
	 * 关闭资源
	 * 
	 * @param conn
	 * @param ps
	 * @param rs
	 */
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
