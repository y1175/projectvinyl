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
import com.homedream.service.MemberService;

public class ModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		int id=(int)session.getAttribute("mem_no");
		System.out.println("id:"+id);
		ActionForward f=new ActionForward();
		if(id==0)
		{
			f.setForward(false);
			f.setUrl("login.do");
			
		}
		else
		{
			List<MemberDTO> list=new ArrayList<>();
			MemberService service=MemberService.getService();
			list=service.memberInfo(id);
			request.setAttribute("list", list);
			
			f.setForward(true);
			f.setUrl("/communitymain.jsp?page=membermodify.jsp");
		}
		
		return f;
	}

}
