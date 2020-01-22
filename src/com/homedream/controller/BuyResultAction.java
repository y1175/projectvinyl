package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.ItemDTO;
import com.homedream.dto.MemberDTO;
import com.homedream.service.BuyService;

public class BuyResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BuyService service = BuyService.getService();
		
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		ItemDTO itemdto = service.getBuy(mem_no, item_no); // 오더리스트에 값 넣음
		MemberDTO memberdto = service.getBuyMember(mem_no);
		
		request.setAttribute("memberdto", memberdto);
		request.setAttribute("itemdto", itemdto);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/buyresult.jsp");
		
		return forward;
	}

}
