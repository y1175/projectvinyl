package hs.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hs.com.homedream.service.QuestionService;

public class hs_QuestionDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();
		
        String no=request.getParameter("no");
        System.out.println("삭제 부분임"+no);
		
		int q_no=1;
		
		if(no!=null && !("".equals(no))) {
			q_no=Integer.parseInt(no);
		}
		
		System.out.println("삭제 부분임"+q_no);
		
		QuestionService service=QuestionService.getService();
		service.questionDelete(q_no);
		
		forward.setForward(true);
		forward.setUrl("hs_questionlist.do");
		
		return forward;
	}

}
