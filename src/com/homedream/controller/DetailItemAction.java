package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.ItemDTO;
import com.homedream.service.ItemService;

public class DetailItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		
		ItemService service = ItemService.getInstance();
		ItemDTO dto = service.getDetail(itemNo);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/detailItem.jsp");
		return forward;
	}

}
