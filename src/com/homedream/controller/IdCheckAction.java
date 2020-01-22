package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.MemberService;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberService service = MemberService.getService();
		int row = service.idCheck(id);
		request.setAttribute("data", row);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/checkResult.jsp");
		return forward;
	}

}
