package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.BoardService;

public class BoardLikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardService service = BoardService.getService();
		int result = service.getUpdateLike(num);
		
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/likeno.jsp");
		
		return forward;
	}

}
