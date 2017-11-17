package com.hck.struts.form;

import java.sql.Date;

public class FileForm {
	int file_id;
	String file_name;
	Date file_date;
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public Date getFile_date() {
		return file_date;
	}
	public void setFile_date(Date date) {
		this.file_date = date;
	}
	
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	@Override
	public String toString() {
		return "FileForm [file_name=" + file_name + ", file_date=" + file_date + "]";
	}
}
