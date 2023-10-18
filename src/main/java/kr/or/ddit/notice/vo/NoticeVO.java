package kr.or.ddit.notice.vo;

public class NoticeVO {
	
	private int notice_id   ;
	private String admin_id    ;
	private String notice_tit  ;
	private String notice_cn   ;
	private String notice_date ;
	private int notice_rdcnt;
	
	public NoticeVO() {

	}
	
	public NoticeVO(int notice_id, String admin_id, String notice_tit, String notice_cn, String notice_date, int notice_rdcnt) {
		super();
		this.notice_id = notice_id;
		this.admin_id = admin_id;
		this.notice_tit = notice_tit;
		this.notice_cn = notice_cn;
		this.notice_date = notice_date;
		this.notice_rdcnt = notice_rdcnt;
	}
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getNotice_tit() {
		return notice_tit;
	}
	public void setNotice_tit(String notice_tit) {
		this.notice_tit = notice_tit;
	}
	public String getNotice_cn() {
		return notice_cn;
	}
	public void setNotice_cn(String notice_cn) {
		this.notice_cn = notice_cn;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_rdcnt() {
		return notice_rdcnt;
	}
	public void setNotice_rdcnt(int notice_rdcnt) {
		this.notice_rdcnt = notice_rdcnt;
	}

	@Override
	public String toString() {
		return "NoticeVO [notice_id=" + notice_id + ", admin_id=" + admin_id + ", notice_tit=" + notice_tit
				+ ", notice_cn=" + notice_cn + ", notice_date=" + notice_date + ", notice_rdcnt=" + notice_rdcnt + "]";
	}


}
