package com.sist.dao;
/*
 *   Java : 변수 / 연산자 / 제어문 
 *          객체 지향 
 *          인터페이스
 *          java.lang / java.util / java.io / java.sql
 *                                            | Connection
 *                                            | PreparedStatement
 *                                            | ResultSet
 *                       | Date     | FileReader 
 *                                  | BufferedReader 
 *           | Object/String 
 *         => 어노테이션 / JSON 
 *   Oracle : INSERT / UPDATE / DELETE / SELECT 
 *                                       | JOIN / SubQuery
 *   JSP 
 *    = MVC구조 이해   Model = View = Controller
 *                     |       |       |
 *                                    Model + View 연결
 *                             요청 처리 결과에 대한 화면 
 *                    기능 처리 (요청에 대한)
 *                    => 실무 : MVC(99%)
 *                    Model : DAO , Manager , VO 포함 
 *    = 기본 CRUD : 게시판 
 *       | Cookie / Session
 *       ** 면접 : MVC / cookie VS session 
 *   -----------------------------------------------------
 *   Spring 
 *       DI / AOP / Transaction / MVC  => security / betch 
 *       ----------------------------
 *   Spring-Boot 
 *       @RestController / @Controller 
 *       @Autowired 
 *       -----------------------------
 *       JSON : 순수하게 서버로만 사용 
 *        | 서버 / 클라이언트 분리 
 *   
 *   Jquery / Vue / React 
 *   -----------------------------------------
 *   MyBatis / JPA (부) 
 *   -------------------
 *   Vue / React 
 *   -----------------------------------------
 *   
 */
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class NoticeDAO {
  private static SqlSessionFactory ssf; //xml을 읽어서 처리
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
	  // 여러개 동시에 사용 => 공통 모듈 => 중복 제거
  }
  /*
   *   <select id="noticeListData" parameterType="int"
	    resultType="com.sist.vo.NoticeVO"
	   >
	     SELECT no,state,name,subject,
	          TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit
	     FROM notice
	     ORDER BY no DESC
	     OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
	   </select>
	   <select id="noticeTotalPage" resultType="int">
	     SELECT CEIL(COUNT(*)/10.0) 
	     FROM notice
	   </select>
   */
  /*
   *   <insert id="noticeInsert" parameterType="com.sist.vo.NoticeVO">
	     INSERT INTO notice VALUES(
	       notice_no_seq.nextval,
	       #{state},#{name},#{subject},#{content},
	       SYSDATE , 0 , #{filename},#{filesize}
	     )
	   </insert>
   */
  public static void noticeInsert(NoticeVO vo)
  {
	  try
	  {
		  SqlSession session=ssf.openSession(true);
		  session.insert("noticeInsert",vo);
		  session.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
  }
  public static List<NoticeVO> noticeListData(int start)
  {
	  List<NoticeVO> list=null;
	  try
	  {
		  SqlSession session=ssf.openSession();
		  list=session.selectList("noticeListData",start);
		  session.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  return list;
  }
  public static int noticeTotalPage()
  {
	  int total=0;
	  try
	  {
		  SqlSession session=ssf.openSession();
		  total=session.selectOne("noticeTotalPage");
		  session.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  return total;
  }
  /*
   *   <update id="noticeHitIncrement" parameterType="int">
    UPDATE notice SET
    hit=hit+1
    WHERE no=#{no}
   </update>
   <select id="noticeDetailData" resultType="com.sist.vo.NoticeVO"
    parameterType="int"
   >
     SELECT * FROM notice
     WHERE no=#{no}
   </select>
   */
  public static NoticeVO noticeDetailData(int no)
  {
	  NoticeVO vo=null;
	  try
	  {
		  SqlSession session=ssf.openSession();
		  session.update("noticeHitIncrement",no);
		  session.commit();
		  vo=session.selectOne("noticeDetailData",no);
		  session.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  return vo;
  }
}