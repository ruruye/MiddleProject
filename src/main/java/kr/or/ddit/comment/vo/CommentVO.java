package kr.or.ddit.comment.vo;

public class CommentVO {
	
	private int comm_id;
	private int post_id;
	private String mem_id;
	private String comm_cn;
	private String comm_date;
	private String admin_id;
	
	public int getComm_id() {
		return comm_id;
	}
	public void setComm_id(int comm_id) {
		this.comm_id = comm_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getComm_cn() {
		return comm_cn;
	}
	public void setComm_cn(String comm_cn) {
		this.comm_cn = comm_cn;
	}
	public String getComm_date() {
		return comm_date;
	}
	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

}
