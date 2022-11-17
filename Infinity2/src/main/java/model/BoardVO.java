package model;

import java.util.Date;

public class BoardVO {

	private int bo_num;
	private String bo_category;
	private String bo_title;
	private String bo_content;
	private String bo_mb_id;
	private String bo_mb_name;
	private int bo_hit;
	private Date bo_inputdate;
	private String bo_ip;
	
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public String getBo_category() {
		return bo_category;
	}
	public void setBo_category(String bo_category) {
		this.bo_category = bo_category;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_mb_id() {
		return bo_mb_id;
	}
	public void setBo_mb_id(String bo_mb_id) {
		this.bo_mb_id = bo_mb_id;
	}
	public String getBo_mb_name() {
		return bo_mb_name;
	}
	public void setBo_mb_name(String bo_mb_name) {
		this.bo_mb_name = bo_mb_name;
	}
	public int getBo_hit() {
		return bo_hit;
	}
	public void setBo_hit(int bo_hit) {
		this.bo_hit = bo_hit;
	}
	public Date getBo_inputdate() {
		return bo_inputdate;
	}
	public void setBo_inputdate(Date bo_inputdate) {
		this.bo_inputdate = bo_inputdate;
	}
	public String getBo_ip() {
		return bo_ip;
	}
	public void setBo_ip(String bo_ip) {
		this.bo_ip = bo_ip;
	}
	@Override
	public String toString() {
		return "BoardVO [bo_num=" + bo_num + ", bo_category=" + bo_category + ", bo_title=" + bo_title + ", bo_content="
				+ bo_content + ", bo_mb_id=" + bo_mb_id + ", bo_mb_name=" + bo_mb_name + ", bo_hit=" + bo_hit
				+ ", bo_inputdate=" + bo_inputdate + ", bo_ip=" + bo_ip + "]";
	}
	
	
}
