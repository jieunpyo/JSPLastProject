package com.sist.model;

import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.QnABoardDAO;
import com.sist.vo.QnABoardVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class QnABoardModel {
  @RequestMapping("qna/list.do")
  public String qna_list(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  int start=(curpage-1)*10;
	  List<QnABoardVO> list=QnABoardDAO.qnaListData(start);
	  int totalpage=QnABoardDAO.qnaTotalPage();
	  request.setAttribute("list", list);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("main_jsp", "../qna/list.jsp");
	  return "../main/main.jsp";
  }
}
