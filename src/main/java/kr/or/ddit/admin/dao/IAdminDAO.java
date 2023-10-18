package kr.or.ddit.admin.dao;

import kr.or.ddit.admin.vo.AdminVO;

public interface IAdminDAO {
	
	// 관리자 정보 가져오기 (아이디만)
	public AdminVO getAdmin(int adminId);

}
