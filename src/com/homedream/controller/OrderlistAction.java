package com.homedream.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.MemberDTO;
import com.homedream.dto.OrderListDTO;
import com.homedream.service.MemberService;

public class OrderlistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		int id=(int)session.getAttribute("mem_no");
		ActionForward f=new ActionForward();
		if(id==0)
		{
			f.setForward(false);
			f.setUrl("homedream.do");
			
		}
		else
		{
			List<OrderListDTO> list=new ArrayList<>();
			List<MemberDTO> mlist=new ArrayList<>();
			MemberService service=MemberService.getService();
			list=service.orderlist(id);
			mlist=service.memberlist(id);
			request.setAttribute("list", list);
			request.setAttribute("mlist", mlist);
			
			f.setForward(true);
			f.setUrl("/communitymain.jsp?page=orderlist.jsp");
		}
		
		return f;
	}

	
}
