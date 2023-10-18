package kr.or.ddit.member.service;

import kr.or.ddit.member.vo.AuthorityVO;
import kr.or.ddit.member.vo.MemberVO;

import java.util.Map;

public interface IMemberService {
    // 회원아이디로 회원정보 찾기
    public MemberVO getMember(String memId);

    // 회원가입
    public int joinMember(MemberVO mv);

    // 로그인
    public MemberVO loginMember(MemberVO mv);

    // 회원 수정
    public int updateMember(MemberVO mv);

    // 회원 탈퇴 및 삭제
    public int deleteMember(MemberVO mv);

    // 아이디로 권한 찾기
    public AuthorityVO getAuthority(AuthorityVO vo);

}
