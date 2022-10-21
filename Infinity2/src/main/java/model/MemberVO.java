package model;

import java.util.Date;

public class MemberVO {

	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_email;
	private String mb_zipcode;
	private String mb_addr;
	private String mb_detailAddr;
	private String mb_phone;
	private String mb_birth;
	private String mb_gender;
	private Date mb_joindate;
	private String mb_out;
	
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_zipcode() {
		return mb_zipcode;
	}
	public void setMb_zipcode(String mb_zipcode) {
		this.mb_zipcode = mb_zipcode;
	}
	public String getMb_addr() {
		return mb_addr;
	}

	public void setMb_addr(String mb_addr) {
		this.mb_addr = mb_addr;
	}
	public String getMb_detailAddr() {
		return mb_detailAddr;
	}
	public void setMb_detailAddr(String mb_detailAddr) {
		this.mb_detailAddr = mb_detailAddr;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_birth() {
		return mb_birth;
	}
	public void setMb_birth(String mb_birth) {
		this.mb_birth = mb_birth;
	}
	public String getMb_gender() {
		return mb_gender;
	}
	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}

	public Date getMb_joindate() {
		return mb_joindate;
	}
	public void setMb_joindate(Date mb_joindate) {
		this.mb_joindate = mb_joindate;
	}
	public String getMb_out() {
		return mb_out;
	}
	public void setMb_out(String mb_out) {
		this.mb_out = mb_out;
	}
	
	@Override
	public String toString() {
		return "MemberVO [mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name + ", mb_email=" + mb_email
				+ ", mb_zipcode=" + mb_zipcode + ", mb_addr=" + mb_addr + ", mb_detailAddr=" + mb_detailAddr
				+ ", mb_phone=" + mb_phone + ", mb_birth=" + mb_birth + ", mb_gender=" + mb_gender + ", mb_joindate="
				+ mb_joindate + ", mb_out=" + mb_out + "]";
	}
	
	
	
}
