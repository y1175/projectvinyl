package hs.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hs.com.homedream.service.QuestionService;

public class hs_AnswerDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();
		int a_no=Integer.getInteger(request.getParameter("a_no"));		
		int q_no=Integer.getInteger(request.getParameter("p_no"));
		
		QuestionService service=QuestionService.getService();
		service.getAnswerDelete(a_no);
		
		forward.setForward(true);
		forward.setUrl("hs_questiondetail.do?no"+q_no);
		
		return forward;
	}

}
