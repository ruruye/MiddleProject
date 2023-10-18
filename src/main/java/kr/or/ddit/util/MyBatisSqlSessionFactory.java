package kr.or.ddit.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class MyBatisSqlSessionFactory {
    private static SqlSessionFactory factory;

    static {
        InputStream in = null;
        try {
            // 1-1. 환경설정 파일을 읽어 올 스트림 객체 생성
            in = Resources.getResourceAsStream("mybatis/config/mybatis-config.xml");
            if (in == null) {
				System.out.println("in인 NULL값 입니다.");
			}

            // 1-2. 환경설정 파일을 읽어와 환경 설정을 완성한 후 SQL문을 호출해서 실행할 수 있는 객체를 생성할 수 있는 SQLSessionFactory 객체를 생성한다.
            factory = new SqlSessionFactoryBuilder().build(in);

        } catch (Exception e) {
            System.out.println("myBatis 초기화 실패");
            e.printStackTrace();
        } finally {
            if (in != null) try {
                in.close();
            } catch (Exception ignored) {}
        }
    }
    
    // SqlSession 객체를 반환하는 메소드
    public static SqlSession getSqlSession() {
        return factory.openSession();
    }
    
    
}
