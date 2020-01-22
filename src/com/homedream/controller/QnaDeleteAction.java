package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.MemberService;

public class QnaDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int q_no=Integer.parseInt(request.getParameter("q_no"));
		MemberService service=MemberService.getService();
		service.qnaDelete(q_no);
		
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("qnaadmin.do");
		return f;
	}

}
