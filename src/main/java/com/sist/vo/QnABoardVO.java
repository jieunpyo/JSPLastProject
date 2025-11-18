package com.sist.vo;
/*
 *  NO       NOT NULL NUMBER         
	ID                VARCHAR2(20)   
	NAME     NOT NULL VARCHAR2(51)   
	SUBJECT  NOT NULL VARCHAR2(2000) 
	CONTENT  NOT NULL CLOB           
	HIT               NUMBER         
	GROUP_ID          NUMBER         
	STEP              NUMBER         
	INDENT            NUMBER         
	REGDATE           DATE    
 */
import java.util.*;

import lombok.Data;
@Data
public class QnABoardVO {
   private int no,hit,group_id,step,indent,state;
   private String id,name,subject,content,dbday;
   private Date regdate;
   
}
