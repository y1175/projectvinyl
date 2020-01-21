package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.service.MemberService;

public class YIBoardSelectDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] selected=request.getParameterValues("select");
		System.out.println(selected[0]+","+selected[1]);
		MemberService service=MemberService.getService();
		for(int i=0; i<=selected.length;i++)
		{
			
		
		service.boardDelete(Integer.parseInt(selected[i]));
		}
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("yiadminboard.do");
		
		
		return f;
	}

}
