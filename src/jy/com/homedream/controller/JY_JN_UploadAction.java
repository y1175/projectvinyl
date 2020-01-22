package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

public class JY_JN_UploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		
		ActionForward forward = new ActionForward();
		
		forward.setForward(true);
		forward.setUrl("/hs_communitymain.jsp?page=jy_jn/jy_jn_uploadform.jsp");		
		 
		return forward;
	}

}
