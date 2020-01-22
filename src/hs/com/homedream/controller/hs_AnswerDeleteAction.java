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
		
		String a_no = request.getParameter("a_no");
		String q_no = request.getParameter("q_no");
		
		int ano = 1;
		int qno = 1;
		
		if(a_no!=null&&!(a_no.equals(""))) {
			ano= Integer.parseInt(a_no);
		}
		
		if(q_no!=null&&!(q_no.equals(""))) {
			qno= Integer.parseInt(q_no);
		}
		
		System.out.println("È­¼ö ´ñ±Û"+ano);
		System.out.println("È­¼ö ´ñ±Û"+qno);
		
		QuestionService service=QuestionService.getService();
		service.getAnswerDelete(ano);
		
		forward.setForward(true);
		forward.setUrl("hs_questiondetail.do?no="+q_no);
		
		return forward;
	}

}
