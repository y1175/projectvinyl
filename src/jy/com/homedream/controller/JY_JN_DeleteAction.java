package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_DeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String num = request.getParameter("num");
		
		int bno = 1;
		
		if(num!=null &&!("".equals(num))) {
			bno = Integer.parseInt(num);
		}
		
		System.out.println("dddd");
		System.out.println(bno);
		
		JY_JN_Service service = JY_JN_Service.getService();
		service.jn_getDelete(bno);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("jy_list.do");
		
		return forward;
	}

}
