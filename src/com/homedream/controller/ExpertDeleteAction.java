package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.ExpertService;

public class ExpertDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String num = request.getParameter("no");
		
		int no = 1;
		if(num!=null)
		{
			no=Integer.parseInt(num);
		}
		ExpertService service = ExpertService.getService();
		service.dataDelete(no);
		
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("managerlist.do");

		return forward;
	}

}
