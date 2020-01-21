package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

public class YILogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		if(session.getAttribute("userId")!=null && session!=null)
		{
			session.invalidate();
			System.out.println("로그아웃 성공");
		}
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("homedream.do");
		return f;
	}

}
