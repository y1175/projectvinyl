package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

public class YILoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/yi_member/loginform.jsp");
		return f;
	}

}
