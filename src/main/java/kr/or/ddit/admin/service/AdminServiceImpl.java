package kr.or.ddit.admin.service;

import kr.or.ddit.admin.dao.AdminDAOImpl;
import kr.or.ddit.admin.dao.IAdminDAO;
import kr.or.ddit.admin.vo.AdminVO;

public class AdminServiceImpl implements IAdminService {
	
	private static IAdminService adminService;
	private IAdminDAO dao;
	
	private AdminServiceImpl() {
		dao = AdminDAOImpl.getInstance();
	}
	
	public static IAdminService getInstance() {
		if(adminService == null) adminService = new AdminServiceImpl();
		return adminService;
	}

	@Override
	public AdminVO getAdmin(int adminId) {
		// TODO Auto-generated method stub
		return dao.getAdmin(adminId);
	}

}
