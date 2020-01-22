package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.BoardDTO;
import com.homedream.service.BoardService;

public class BoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String num = request.getParameter("num");
		
		int bno = 1;
		
		if(num!=null &&!("".equals(num))) {
			bno = Integer.parseInt(num);
		}
		
		System.out.println( "업데이트 글번호"+bno);

		BoardService service = BoardService.getService();
		BoardDTO dto = service.getSelect(bno);
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/communitymain.jsp?page=updateform.jsp");
		
		return forward;
	}

}
