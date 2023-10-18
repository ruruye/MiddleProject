package kr.or.ddit.member.dao;

import kr.or.ddit.member.vo.AuthorityVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;
import org.apache.ibatis.session.SqlSession;

public class MemberDAOImpl implements IMemberDAO {
    private static IMemberDAO memberDAO;

    private MemberDAOImpl() {}

    public static IMemberDAO getInstance() {
        if(memberDAO == null) memberDAO = new MemberDAOImpl();
        return memberDAO;
    }


    @Override
    public MemberVO getMember(String memId) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        MemberVO mv = null;

        try {
            mv = session.selectOne("member.getMember", memId);
        } finally {
            session.close();
        }
        return mv;
    }

    @Override
    public int joinMember(MemberVO mv) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;

        try {
            cnt = session.insert("member.joinMember", mv);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("joinMember.cnt : " + cnt);
        return cnt;
    }
    

    @Override
    public MemberVO loginMember(MemberVO mv) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        MemberVO loginMember = null;

        try {
            loginMember = session.selectOne("member.loginMember", mv);
        } finally {
            session.close();
        }
        System.out.println("loginMember : " + loginMember);
        return loginMember;
    }

    @Override
    public int updateMember(MemberVO mv) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;

        try {
            cnt = session.update("member.updateMember", mv);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("updateMember.cnt : " + cnt);
        return cnt;
    }

    @Override
    public int deleteMember(MemberVO mv) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        int cnt = 0;

        try {
            cnt = session.delete("member.deleteMember", mv);
            session.commit();
        } finally {
            session.close();
        }
        System.out.println("deleteMember.cnt : " + cnt);
        return cnt;
    }

    @Override
    public AuthorityVO getAuthority(AuthorityVO vo) {
        SqlSession session = MyBatisSqlSessionFactory.getSqlSession();
        AuthorityVO VO = null;

        try {
            VO = session.selectOne("member.getAuthority", vo);
        } finally {
            session.close();
        }
        return VO;
    }
}
