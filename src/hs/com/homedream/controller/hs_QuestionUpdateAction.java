package hs.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hs.com.homedream.question.QuestionDTO;
import hs.com.homedream.service.QuestionService;

public class hs_QuestionUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();

		String no=request.getParameter("no");
		
		int q_no=1;
		
		if(no!=null && !("".equals(no))) {
			q_no=Integer.parseInt(no);
		}
		
		QuestionService service=QuestionService.getService();
		
		QuestionDTO dto=service.detailSelect(q_no);
		request.setAttribute("dto", dto);
		
		forward.setForward(true);
		forward.setUrl("/hs_communitymain.jsp?page=hs_question/hs_question_update.jsp");
		
		return forward;
	}

}
