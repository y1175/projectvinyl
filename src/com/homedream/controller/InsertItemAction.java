package com.homedream.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.CategoriDTO;
import com.homedream.service.ItemService;

public class InsertItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		
		ItemService service = ItemService.getInstance();
		List<CategoriDTO> list = service.getCategori(); 
		
		ActionForward forward = new ActionForward();
		request.setAttribute("list", list);
		forward.setForward(true);
		forward.setUrl("/storeadminmain.jsp?page=insertItem.jsp");
		
		return forward;
	}

}
