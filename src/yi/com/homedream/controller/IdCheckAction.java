package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.service.YIMemberService;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		YIMemberService service = YIMemberService.getService();
		int row = service.idCheck(id);
		request.setAttribute("data", row);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/yi_member/checkResult.jsp");
		return forward;
	}

}
