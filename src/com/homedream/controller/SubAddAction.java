package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.SubBoardDTO;
import com.homedream.service.BoardService;

public class SubAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String subcontent = request.getParameter("subcontent");
		
		SubBoardDTO subdto = new SubBoardDTO();
		
		subdto.setBno(num);
		subdto.setMem_no(58);
		subdto.setSubcontent(subcontent);
		
		BoardService service = BoardService.getService();
		String subid = service.getAddSubBoard(subdto);
		
		request.setAttribute("subid", subid);
		
		ActionForward forward =	new ActionForward();
		forward.setForward(true);
		forward.setUrl("boarddetail.do?num="+num);
		
		return forward;
	}

}
