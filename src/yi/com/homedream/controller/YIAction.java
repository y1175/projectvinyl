package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;



public class YIAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	HttpSession session=request.getSession();
	ActionForward f=new ActionForward();
	if(session.getAttribute("userId")==null)
	{
		
		f.setForward(true);
		f.setUrl("/yi_member/notlogin.jsp");
	}
	else
	{
		f.setForward(true);
		f.setUrl("/yi_member/test.jsp");
	}
		return f;
		
	}

}
