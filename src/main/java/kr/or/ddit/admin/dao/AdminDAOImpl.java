package kr.or.ddit.admin.dao;

import kr.or.ddit.admin.vo.AdminVO;

public class AdminDAOImpl implements IAdminDAO{
	
	private static IAdminDAO adminDAO;
	
	private AdminDAOImpl() {}
	
	public static IAdminDAO getInstance()	{
		if(adminDAO == null) adminDAO = new AdminDAOImpl();
		return adminDAO;
	}

	@Override
	public AdminVO getAdmin(int adminId) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
