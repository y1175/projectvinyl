package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.service.YIMemberService;

public class YIQnaDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int q_no=Integer.parseInt(request.getParameter("q_no"));
		YIMemberService service=YIMemberService.getService();
		service.qnaDelete(q_no);
		
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("yiqnaadmin.do");
		return f;
	}

}
