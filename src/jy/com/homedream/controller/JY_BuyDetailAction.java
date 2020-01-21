package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.DTO.JY_ItemDTO;
import jy.com.homedream.DTO.JY_JN_MemberDTO;
import jy.com.homedream.service.JY_BuyService;

public class JY_BuyDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
JY_BuyService service = JY_BuyService.getService();
		
		int mem_no = Integer.parseInt(request.getParameter("mem_no"));
		int item_no = Integer.parseInt(request.getParameter("item_no"));
		
		JY_JN_MemberDTO memberdto = service.getBuyMember(mem_no);
		// 인간 정보 가져오기
		
		JY_ItemDTO itemdto = service.getItem(item_no);
		request.setAttribute("memberdto", memberdto);
		request.setAttribute("itemdto", itemdto);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/jy_buydetail.jsp");
		
		return forward;
	}

}
