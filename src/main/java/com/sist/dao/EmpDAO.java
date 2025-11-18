package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class EmpDAO {
   private static SqlSessionFactory ssf;
   static 
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *     <select id="empAllData" resultMap="empMap">
		    SELECT empno,ename,job,
		           TO_CHAR(hiredate,'YYYY-MM-DD') as dbday,
		           dname,loc
		    FROM emp,dept 
		    WHERE emp.deptno=dept.deptno
		  </select>
		  <select id="empAllNames" resultType="string">
		    SELECT ename FROM emp
		  </select>
    */
   public static List<EmpVO> empAllData()
   {
	   SqlSession session=ssf.openSession();
	   List<EmpVO> list=session.selectList("empAllData");
	   session.close();
	   return list;
   }
   public static List<String> empAllNames()
   {
	   SqlSession session=ssf.openSession();
	   List<String> list=session.selectList("empAllNames");
	   session.close();
	   return list;
   }
   /*
    *   <select id="empFindData" resultMap="empMap" 
    parameterType="hashmap">
    SELECT empno,ename,job,
           TO_CHAR(hiredate,'YYYY-MM-DD') as dbday,
           dname,loc
    FROM emp,dept 
    WHERE emp.deptno=dept.deptno
    
    <trim prefix="AND ename IN("  suffix=")" 
          suffixOverrides=")">
     <foreach collection="nameArr" item="ename"
      close=")" separator=","
     >
      #{ename}
     </foreach>
    
    </trim>
    
  </select>
    */
   public static List<EmpVO> empFindData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<EmpVO> list=session.selectList("empFindData",map);
	   session.close();
	   return list;
   }
   /*
    *    <select id="empDeleteList" resultType="com.sist.vo.EmpVO" parameterType="hashmap">
    SELECT empno,ename,job,TO_CHAR(hiredate,'yyyy-mm-dd') as dbday, sal
    FROM ${table_name}
  </select>
    */
   public static List<EmpVO> empDeleteList(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<EmpVO> list=session.selectList("empDeleteList",map);
	   session.close();
	   return list;
   }
   /*
    *  <delete id="allDelete" parameterType="int">
    */
   public static void allDelete(int empno)
   {
	   try
	   {
	   SqlSession session=ssf.openSession(true);
	   session.delete("allDelete",empno);
	   session.close();
	   }catch(Exception ex) {ex.printStackTrace();}
   }
}
