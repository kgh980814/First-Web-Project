package model;

import java.util.Date;

public class ContactVO {

	private int co_num;
	private String co_fname;
	private String co_email;
	private String co_message;
	private Date co_inputdate;
	
	public int getCo_num() {
		return co_num;
	}
	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}
	public String getCo_fname() {
		return co_fname;
	}
	public void setCo_fname(String co_fname) {
		this.co_fname = co_fname;
	}
	public String getCo_email() {
		return co_email;
	}
	public void setCo_email(String co_email) {
		this.co_email = co_email;
	}
	public String getCo_message() {
		return co_message;
	}
	public void setCo_message(String co_message) {
		this.co_message = co_message;
	}
	public Date getCo_inputdate() {
		return co_inputdate;
	}
	public void setCo_inputdate(Date co_inputdate) {
		this.co_inputdate = co_inputdate;
	}
	
	
	
}
