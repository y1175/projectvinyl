package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_LikeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		JY_JN_Service service = JY_JN_Service.getService();
		int result = service.jn_getUpdateLike(num);
		
		request.setAttribute("result", result);
		request.setAttribute("num", num);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/jy_jn/jy_jn_likeno.jsp");
		
		return forward;
	}

}
