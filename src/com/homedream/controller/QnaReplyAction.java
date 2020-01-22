package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.AnswerDTO;
import com.homedream.service.QuestionService;

public class QnaReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
ActionForward forward=new ActionForward();
		
		int q_no=Integer.parseInt(request.getParameter("q_no"));
		
		String answer=request.getParameter("answer");
		
		AnswerDTO dto=new AnswerDTO();
		
		dto.setQ_no(q_no);
		dto.setMem_no(2);
		dto.setContent(answer);
		
		QuestionService service=QuestionService.getService();
		
		String answerid=service.getAnswerAdd(dto);
		
		request.setAttribute("answer", answerid);
		
		forward.setForward(true);
		forward.setUrl("questiondetail.do?no="+q_no);
		
		return forward;
	}

}
