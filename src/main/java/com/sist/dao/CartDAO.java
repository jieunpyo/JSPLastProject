package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
/*
 * 	<insert id="cartInsert" parameterType="com.sist.vo.CartVO">
    INSERT INTO cart VALUES(
      cart_no_seq.nextval,
      #{gno},
      #{id},
      #{account},
      0,
      SYSDATE
    )
  </insert>
  <update id="cartUpdate" parameterType="com.sist.vo.CartVO">
    UPDATE cart SET
    account=account+#{account}
    WHERE gno=#{gno} AND id=#{id}
  </update>
 */
public class CartDAO {
	  private static SqlSessionFactory ssf;
	  static
	  {
		  ssf=CreateSqlSessionFactory.getSsf();
		  // MyBatis에 설정된 XML파일 읽기 
	  }
	  // 1. insert
	  public static void cartInsert(CartVO vo)
	  {
		  try
		  {
			  SqlSession session=ssf.openSession(true);
			  int count=session.selectOne("cartCount",vo);
			  if(count==0)
			  {
				  session.insert("cartInsert",vo);
			  }
			  else
			  {
				  session.update("cartUpdate",vo);
			  }
			  session.close();
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
	  }
	  /*
	   * <select id="cartMyListData" parameterType="string"
		   resultMap="cartMap"
		  >
		    SELECT cart.no,goods_poster,goods_name,goods_price,
		    	   account,TO_CHAR(regdate,'YYYY-MM-DD') as dbday
		    FROM cart,goods_all
		    WHERE cart.gno=goods_all.no
		    AND id=#{id}
		    ORDER BY no DESC
		  </select>
	   */
	  public static List<CartVO> cartMyListData(String id)
	  {
		  List<CartVO> list=null;
		  try
		  {
			  SqlSession session=ssf.openSession();
			  list=session.selectList("cartMyListData",id);
			  session.close();
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  return list;
	  }
}
