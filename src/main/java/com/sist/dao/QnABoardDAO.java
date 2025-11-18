package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class QnABoardDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  
  /*
   *   <select id="qnaListData" parameterType="int"
		    resultType="com.sist.vo.QnABoardVO"
		  >
		  SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit
		  FROM qnaBoard
		  ORDER BY group_id DESC , step ASC
		  OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY
		  </select>
		  <select id="qnaTotalPage" resultType="int">
		    SELECT CEIL(COUNT(*)/10.0) 
		    FROM qnaBoard
		  </select>
   */
  public static List<QnABoardVO> qnaListData(int start)
  {
	   List<QnABoardVO> list=null;
	   try
	   {
		   SqlSession session=ssf.openSession();
		   list=session.selectList("qnaListData",start);
		   session.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   return list;
  }
  public static int qnaTotalPage() 
  {
	  int total=0;
	  try
	  {
		  SqlSession session=ssf.openSession();
		  total=session.selectOne("qnaTotalPage");
		  session.close();
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  return total;
  }
}
