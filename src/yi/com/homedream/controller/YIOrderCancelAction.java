package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.service.YIMemberService;

public class YIOrderCancelAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println(request.getParameter("num"));
		
		YIMemberService service=YIMemberService.getService();
		service.orderCancel(num);
		
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("yiorderlist.do");
		return f;
	}

}
