package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.DTO.JY_JN_BoardDTO;
import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_UpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String num = request.getParameter("num");
		
		int bno = 1;
		
		if(num!=null &&!("".equals(num))) {
			bno = Integer.parseInt(num);
		}
		
		
		JY_JN_Service service = JY_JN_Service.getService();
		JY_JN_BoardDTO dto = service.jn_getSelect(bno);
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/hs_communitymain.jsp?page=jy_jn/jy_jn_updateform.jsp");
		
		return forward;
	}

}
