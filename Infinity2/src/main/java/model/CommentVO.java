package model;

import java.util.Date;

public class CommentVO {

	private int com_num;
	private int com_refnum;
	private String com_content;
	private String com_mb_id;
	private String com_mb_name;
	private Date com_inputdate;
	
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public int getCom_refnum() {
		return com_refnum;
	}
	public void setCom_refnum(int com_refnum) {
		this.com_refnum = com_refnum;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public String getCom_mb_id() {
		return com_mb_id;
	}
	public void setCom_mb_id(String com_mb_id) {
		this.com_mb_id = com_mb_id;
	}
	public String getCom_mb_name() {
		return com_mb_name;
	}
	public void setCom_mb_name(String com_mb_name) {
		this.com_mb_name = com_mb_name;
	}
	public Date getCom_inputdate() {
		return com_inputdate;
	}
	public void setCom_inputdate(Date com_inputdate) {
		this.com_inputdate = com_inputdate;
	}
	
	@Override
	public String toString() {
		return "CommentVO [com_num=" + com_num + ", com_refnum=" + com_refnum + ", com_content=" + com_content
				+ ", com_mb_id=" + com_mb_id + ", com_mb_name=" + com_mb_name + ", com_inputdate=" + com_inputdate
				+ "]";
	}
	
	
}
