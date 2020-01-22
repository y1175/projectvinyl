package com.homedream.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.ItemService;

public class DeleteItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		
		ItemService service = ItemService.getInstance();
		service.deleteItem(itemNo);
		ActionForward forward = new ActionForward();
		forward.setForward(false);
		forward.setUrl("itemlist.do");
		return forward;
	}

}
