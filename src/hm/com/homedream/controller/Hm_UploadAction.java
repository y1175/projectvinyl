package hm.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

public class Hm_UploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/hs_communityadminmain.jsp?page=hm_expert/hm_uploadform.jsp");
		
		return forward;
	}

}
