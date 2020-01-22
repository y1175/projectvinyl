package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.service.BoardService;

public class SubDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		int num = Integer.parseInt(request.getParameter("bno"));
		
		BoardService service = BoardService.getService();
		service.getDeleteSubBoard(rno);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("detail.do?num="+num);
		forward.setForward(true);
		
		return forward;
	}

}
