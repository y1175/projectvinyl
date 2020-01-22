package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.MemberService;

public class OrderCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println(request.getParameter("num"));
		
		MemberService service=MemberService.getService();
		service.orderCancel(num);
		
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("orderlist.do");
		return f;
	}

}
