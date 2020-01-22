package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.MemberService;

public class AdminBoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno=Integer.parseInt(request.getParameter("bno"));
		MemberService service=MemberService.getService();
		service.boardDelete(bno);
		
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("adminboarddelete.do");
		
		
		return f;
	}

}
