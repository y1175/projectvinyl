package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.service.MemberService;

public class YIboardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno=Integer.parseInt(request.getParameter("bno"));
		MemberService service=MemberService.getService();
		service.boardDelete(bno);
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("yiadminboard.do");
		
		
		return f;
	}

}
