package com.hck.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import com.hck.struts.form.NewsForm;

public class NewsDao {

	/**
	 * 得到一篇新闻的表单
	 * @param news_id	需要获取的新闻id
	 * @return	返回新闻表单
	 */
	public static NewsForm getNews(int news_id){
		String sql = "select * from news where id = ?";
		NewsForm news = JDBC.getObjectByReflection(NewsForm.class, sql, news_id);
		return news;
	}
	
	/**
	 * 得到所有的新闻
	 * @return	返回新闻列表
	 */
	public static List<NewsForm> getNewsList(){
		String sql = "select * from news";
		ArrayList<NewsForm> list = JDBC.getResouceByReflection(NewsForm.class, sql);
		return list;
	}
	
	public static List<NewsForm> getNewsNames(){
		String sql = "select * from news limit 5";
		ArrayList<NewsForm> list = JDBC.getResouceByReflection(NewsForm.class, sql);
		return list;
	}
	
	/**
	 * 这是添加news
	 * @param form
	 * @return
	 */
	public static boolean addNews(NewsForm form) {
		String sql ="insert into news(news_title, news_content, news_date) values(?,?,?)";
		Date date =new Date();
		System.out.println(date);
		Logger logger =Logger.getLogger(NewsDao.class);
		BasicConfigurator.configure();
		logger.setLevel(Level.INFO);
		logger.info(date);
		
		int res =JDBC.executeUpdate(sql, form.getNews_title(),form.getNews_content(),date);
		
		if(res > 0 ){
			return true;
		}
		return false;
	}
	
	public static boolean deleteNews(int id) {
		String sql ="delete from news where news_id =?";
		int res =JDBC.executeUpdate(sql ,id);
		
		if(res > 0 ){
			return true;
		}
		return false;
		
	}
}
