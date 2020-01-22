package hs.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hs.com.homedream.answer.AnswerDTO;
import hs.com.homedream.service.QuestionService;

public class hs_AnswerAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();
		
		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("화수 댓글 번호"+no);
		// 번호 들어오는거 확인됨
		
		String hs_answer=request.getParameter("hs_answer");
		System.out.println("화수 댓글 내용"+hs_answer);
		
		AnswerDTO dto=new AnswerDTO();
		
		dto.setQ_no(no);
		dto.setMem_no(2);
		dto.setContent(hs_answer);
		
		QuestionService service=QuestionService.getService();
		
		String answerid=service.getAnswerAdd(dto);
		
		request.setAttribute("answer", answerid);
		
		forward.setForward(true);
		forward.setUrl("hs_questiondetail.do?no="+no);
		
		return forward;
	}

}
