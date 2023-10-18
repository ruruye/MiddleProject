package kr.or.ddit.admin.vo;

import kr.or.ddit.member.vo.MemberVO;

public class BlackListVO {
                                 
	private String black_id      ;
	private String mem_id        ;
	private String blank_reason  ;
	private String blank_date    ;
	private MemberVO memVo; 
	
	

	public BlackListVO() {	}

	public BlackListVO(String black_id, String mem_id, String blank_reason, String blank_date) {
		super();
		this.black_id = black_id;
		this.mem_id = mem_id;
		this.blank_reason = blank_reason;
		this.blank_date = blank_date;
	}

	public MemberVO getMemVo() {
		return memVo;
	}
	
	public void setMemVo(MemberVO memVo) {
		this.memVo = memVo;
	}
	public String getBlack_id() {
		return black_id;
	}

	public void setBlack_id(String black_id) {
		this.black_id = black_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBlank_reason() {
		return blank_reason;
	}

	public void setBlank_reason(String blank_reason) {
		this.blank_reason = blank_reason;
	}

	public String getBlank_date() {
		return blank_date;
	}

	public void setBlank_date(String blank_date) {
		this.blank_date = blank_date;
	}

	@Override
	public String toString() {
		return "BlackListVO [black_id=" + black_id + ", mem_id=" + mem_id + ", blank_reason=" + blank_reason
				+ ", blank_date=" + blank_date + "]";
	}
	
	
	
	
}
