package hm.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hm.com.homedream.service.Hm_ExpertService;

public class Hm_DeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String num = request.getParameter("no");
		
		int no = 1;
		if(num!=null)
		{
			no=Integer.parseInt(num);
		}
		Hm_ExpertService service = Hm_ExpertService.getService();
		service.dataDelete(no);
		
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("hm_managerlist.do");

		return forward;
	}

}
