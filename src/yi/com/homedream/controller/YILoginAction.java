package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

public class YILoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		ActionForward f=new ActionForward();
		String id=(String)session.getAttribute("userId");
		if(session.getAttribute("userId")==null)	//로그인 상태가 아닐때
		{			
		f.setForward(true);
		f.setUrl("/hs_communitymain.jsp?page=yi_member/loginform.jsp");
		}
		/*else if(id.equals("admin"))	//admin으로 로그인할때
		{
			f.setForward(true);
			f.setUrl("/hs_memberadminmain.jsp");
		}
		
		else	//회원로그인 할때
		{
			f.setForward(false);
			f.setUrl("homedream.do");
		}*/
		return f;
	}

}
