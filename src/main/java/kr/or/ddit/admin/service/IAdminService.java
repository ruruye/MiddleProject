package kr.or.ddit.admin.service;

import kr.or.ddit.admin.vo.AdminVO;

public interface IAdminService {
	
	// 관리자 정보 가져오기 (아이디만)
	public AdminVO getAdmin(int adminId);

}
