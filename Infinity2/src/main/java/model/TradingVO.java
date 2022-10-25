package model;

import java.util.Date;

public class TradingVO {

	private int tra_num;
	private String tra_account;
	private Date tra_inputdate;
	
	public int getTra_num() {
		return tra_num;
	}
	public void setTra_num(int tra_num) {
		this.tra_num = tra_num;
	}
	public String getTra_account() {
		return tra_account;
	}
	public void setTra_account(String tra_account) {
		this.tra_account = tra_account;
	}
	public Date getTra_inputdate() {
		return tra_inputdate;
	}
	public void setTra_inputdate(Date tra_inputdate) {
		this.tra_inputdate = tra_inputdate;
	}
	
}
