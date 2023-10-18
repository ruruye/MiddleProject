package kr.or.ddit.member.service;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.member.vo.AuthorityVO;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
    private static IMemberService memberService;
    private IMemberDAO dao;

    private MemberServiceImpl() {
        dao = MemberDAOImpl.getInstance();
    }

    public static IMemberService getInstance() {
        if(memberService == null) memberService = new MemberServiceImpl();
        return memberService;
    }


    @Override
    public MemberVO getMember(String memId) {
        return dao.getMember(memId);
    }

    @Override
    public int joinMember(MemberVO mv) {
        return dao.joinMember(mv);
    }

    @Override
    public MemberVO loginMember(MemberVO mv) {
        return dao.loginMember(mv);
    }

    @Override
    public int updateMember(MemberVO mv) {
        return dao.updateMember(mv);
    }

    @Override
    public int deleteMember(MemberVO mv) {
        return dao.deleteMember(mv);
    }

    @Override
    public AuthorityVO getAuthority(AuthorityVO vo) {
        return dao.getAuthority(vo);
    }
}
