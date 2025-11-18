package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class EmpModel {
  // JOIN
  @RequestMapping("emp/list.do")
  public String emp_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  List<EmpVO> list=EmpDAO.empAllData();
	  request.setAttribute("list", list);
	  return "../emp/list.jsp";
  }
  // 동적 연습 => IN사용법 
  // <trim> <if> <foreach> <where> <bind> 
  @RequestMapping("emp/names.do")
  public String emp_names(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  List<String> list=EmpDAO.empAllNames();
	  request.setAttribute("list", list);
	  return "../emp/names.jsp";
  }
  @RequestMapping("emp/info.do")
  public String emp_info(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String[] nameArr=request.getParameterValues("names");
	  Map map=new HashMap();
	  map.put("nameArr", nameArr);
	  // DB연동
	  List<EmpVO> list=EmpDAO.empFindData(map);
	  request.setAttribute("list", list);
	  return "../emp/info.jsp";
  }
  @RequestMapping("emp/delete.do")
  public String delete_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  Map  map=new HashMap();
	  map.put("table_name", "emp_1");
	  List<EmpVO> list1=EmpDAO.empDeleteList(map);
	  map.put("table_name", "emp_2");
	  List<EmpVO> list2=EmpDAO.empDeleteList(map);
	  map.put("table_name", "emp_3");
	  List<EmpVO> list3=EmpDAO.empDeleteList(map);
	  map.put("table_name", "emp_4");
	  List<EmpVO> list4=EmpDAO.empDeleteList(map);
	  map.put("table_name", "emp_5");
	  List<EmpVO> list5=EmpDAO.empDeleteList(map);
	  request.setAttribute("list1", list1);
	  request.setAttribute("list2", list2);
	  request.setAttribute("list3", list3);
	  request.setAttribute("list4", list4);
	  request.setAttribute("list5", list5);
	  
	  return "../emp/delete.jsp";
  }
  @RequestMapping("emp/all.do")
  public String delete_all(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String empno=request.getParameter("empno");
	  EmpDAO.allDelete(Integer.parseInt(empno));
	  return "redirect:../emp/delete.do";
  }
}
