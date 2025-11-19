package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
@Controller
public class NoticeModel {
  @RequestMapping("notice/list.do")
  public String notice_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  int start=(curpage-1)*10;
	  List<NoticeVO> list=NoticeDAO.noticeListData(start);
	  int totalpage=NoticeDAO.noticeTotalPage();
	  request.setAttribute("list", list);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("main_jsp", "../notice/notice_list.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("notice/detail.do")
  public String notice_detail(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String no=request.getParameter("no");
	  // 사용자가 선택해서 => 상세보기 요청 => no
	  // DB 연동 
	  NoticeVO vo=
		NoticeDAO.noticeDetailData(Integer.parseInt(no));
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../notice/notice_detail.jsp");
	  return "../main/main.jsp";
  }
}