package com.homedream.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.QuestionDTO;
import com.homedream.service.QuestionService;

public class QuestionListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();
		QuestionService service=QuestionService.getService();
		//검색(제목과 내용으로만 가능하게 설정)
		String questionsearchtxt=request.getParameter("questionsearchtxt");
		String questionsearch=request.getParameter("questionsearch");
		
		if(questionsearchtxt==null) {
			questionsearchtxt="";
		}
		if(questionsearch==null) {
			questionsearch="";
		}
		//전체 글 갯수
		int totalcount=service.totalQcount(questionsearchtxt,questionsearch);
	   //페이징
		int currpage=1;//1page(null일때 1page를 보여줌)
		String curr=request.getParameter("curr"); //현제페이지 parameter
		if(curr!=null) {
			currpage=Integer.parseInt(curr);//각각 맞는 페이지로..
		}
		
		int pagesize=5; //한페이지에 보여주는 자료수
		int totalpage=(int)Math.ceil((float)totalcount/pagesize); //페이지수
		
		int startrow=(currpage-1)*pagesize+1;
		int endrow=startrow+pagesize-1;
		    if(endrow>totalcount) { 
		    	endrow=totalcount;
		    }
		//페이지블록    
		int pageblocksize=5;//페이지블록수
		int startblock=((currpage-1)/pageblocksize)*pageblocksize+1;
		int endblock=startblock+pageblocksize-1;
		   if(endblock>totalpage)
			   endblock=totalpage; 
		//리스트    
		List<QuestionDTO> list=service.getQlist(startrow,endrow, questionsearch, questionsearchtxt);
		
		request.setAttribute("startblock", startblock);
		request.setAttribute("endblock", endblock);
		request.setAttribute("currpage", currpage);
		request.setAttribute("totalpage", totalpage);
	    
		request.setAttribute("questionsearchtxt", questionsearchtxt);
		request.setAttribute("questionsearch", questionsearch);
		
		request.setAttribute("list", list);
		
		forward.setForward(true);
		forward.setUrl("/communitymain.jsp?page=question/question_list.jsp");
	System.out.println("pagesize"+pagesize);
		return forward;
	}
}
