//설정파일을 읽어들여, 팩토리를 생성하고 쿼리문 수행에 필요한 SqlSesioin 객체를 반환해주는 객체
package mybatis.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConfigManager {
	private static MybatisConfigManager instance;
	String resource = "mybatis/config/config.xml";
	
	InputStream inputStream;
	SqlSessionFactory sqlSessionFactory;
	
	public MybatisConfigManager() {
		 try {
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//생성자를 막았기때문에 오직 이 메서드의 의해서만 인스턴스를 얻어갈수 있도록 제한하자!
	public static MybatisConfigManager getInstance() {
		if(instance ==null) {
			instance = new MybatisConfigManager();
		}
		return instance;
	}
			
	public SqlSession getSqlSession() {
		SqlSession sqlSession = null;
		sqlSession = sqlSessionFactory.openSession();
		return sqlSession;
	}
		//SqlSession을 닫는 메서드(SqlSession을 쿼리문 수행후 이 메서드의 인수로 넘기자)
	public void close(SqlSession sqlSession) {
		sqlSession.close();
	}
}
