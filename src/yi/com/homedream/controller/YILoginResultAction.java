package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.dto.YIMemberDTO;
import yi.com.homedream.service.YIMemberService;

public class YILoginResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		
		YIMemberService service=YIMemberService.getService();
		YIMemberDTO dto=service.getLogin(id,pwd);
		
		ActionForward f=new ActionForward();
		
		if(dto==null)	//로그인 실패
		{
			System.out.println("로그인 실패");
			f.setForward(false);
			f.setUrl("yilogin.do");
		}
		else if(dto.getMemNo()==1)
		{
			HttpSession session=request.getSession();
			session.setAttribute("userId", dto.getId());
			session.setAttribute("mem_no", dto.getMemNo());
			session.setMaxInactiveInterval(60*5);
			f.setForward(true);
			f.setUrl("/hs_memberadminmain.jsp");
			System.out.println("관리자 로그인 성공");
		}
		else
		{
		HttpSession session=request.getSession();
		session.setAttribute("userId", dto.getId());
		session.setAttribute("mem_no", dto.getMemNo());
		session.setMaxInactiveInterval(60*5);
		
		f.setForward(false);
		f.setUrl("homedream.do");
		System.out.println("로그인 성공");
		System.out.println("userId:"+dto.getId());
		System.out.println("userId:"+dto.getMemNo());
		}
		
		return f;
	}

}
