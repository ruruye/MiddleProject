package kr.or.ddit.admin.dao;

import java.util.List;

import kr.or.ddit.admin.vo.BlackListVO;


public interface IBlackListDAO {

	 // 블랙리스트정보 찾기
    public List<BlackListVO> getAllBlack();
  
    // 블랙리스트 수정
    public int updateBlack(BlackListVO mv);

    // 블랙리스트 삭제
    public int deleteblack(BlackListVO mv);
}
