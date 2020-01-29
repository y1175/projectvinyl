package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_SubDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int num = Integer.parseInt(request.getParameter("bno"));
		
		JY_JN_Service service = JY_JN_Service.getService();
		service.jn_getDeleteSubBoard(rno);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("jy_detail.do?num="+num);
		forward.setForward(true);
		
		return forward;
	}

}
