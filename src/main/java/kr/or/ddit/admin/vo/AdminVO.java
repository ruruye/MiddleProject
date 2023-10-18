package kr.or.ddit.admin.vo;

import java.sql.Date;

public class AdminVO {
	private String admin_id      ;
	private String admin_pw      ;
	private String admin_name    ;
	private String admin_email   ;
	private Date admin_resdate ;
	private String admin_tel     ;
	private String black_id      ;
	
	public AdminVO() {}
	
	
	
	public AdminVO(String admin_id, String admin_pw, String admin_name, String admin_email, Date admin_resdate,
			String admin_tel, String black_id) {
		super();
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.admin_name = admin_name;
		this.admin_email = admin_email;
		this.admin_resdate = admin_resdate;
		this.admin_tel = admin_tel;
		this.black_id = black_id;
	}



	public String getAdmin_id() {
		return admin_id;
	}



	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}



	public String getAdmin_pw() {
		return admin_pw;
	}



	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}



	public String getAdmin_name() {
		return admin_name;
	}



	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}



	public String getAdmin_email() {
		return admin_email;
	}



	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}



	public Date getAdmin_resdate() {
		return admin_resdate;
	}



	public void setAdmin_resdate(Date admin_resdate) {
		this.admin_resdate = admin_resdate;
	}



	public String getAdmin_tel() {
		return admin_tel;
	}



	public void setAdmin_tel(String admin_tel) {
		this.admin_tel = admin_tel;
	}



	public String getBlack_id() {
		return black_id;
	}



	public void setBlack_id(String black_id) {
		this.black_id = black_id;
	}
	
	
	
	
}                                
