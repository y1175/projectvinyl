package com.homedream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.ItemDTO;
import com.homedream.dto.MemberDTO;
import com.homedream.dto.OrderListDTO;
import com.homedream.service.MemberService;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		List<ItemDTO> item=new ArrayList<>();
		List<OrderListDTO> order=new ArrayList<>();
		List<MemberDTO> member=new ArrayList<>();
		MemberService service=MemberService.getService();
		member=service.orderDetailMember(num);
		item=service.orderDetailItem(num);
		order=service.orderDetailOrder(num);
		request.setAttribute("items", item);
		request.setAttribute("member", member);
		request.setAttribute("order", order);
		
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/communitymain.jsp?page=orderdetail.jsp?num="+num);
		return f;
	}

}
