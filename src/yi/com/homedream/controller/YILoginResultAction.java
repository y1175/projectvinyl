package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.service.MemberService;

public class YILoginResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		
		MemberService service=MemberService.getService();
		String userId=service.getLogin(id,pwd);
		
		ActionForward f=new ActionForward();
		
		if(userId==null)	//로그인 실패
		{
			System.out.println("로그인 실패");
			f.setForward(false);
			f.setUrl("yilogin.do");
		}
		else
		{
		HttpSession session=request.getSession();
		session.setAttribute("userId", userId);
		session.setMaxInactiveInterval(60*5);
		
		f.setForward(false);
		f.setUrl("yi.do");
		System.out.println("로그인 성공");
		System.out.println("userId:"+userId);
		}
		
		return f;
	}

}
