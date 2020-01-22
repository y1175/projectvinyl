package hm.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hm.com.homedream.dto.Hm_ExpertDTO;
import hm.com.homedream.service.Hm_ExpertService;

public class Hm_ManagerDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String num = request.getParameter("no");

		int no = 1;
		if(num!=null&&!("".equals(num))) {
			no = Integer.parseInt(num);
		}

		Hm_ExpertService service = Hm_ExpertService.getService();
		Hm_ExpertDTO dto = service.getSelect(no);

		request.setAttribute("dto", dto);
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/hs_communityadminmain.jsp?page=hm_expert/hm_managerdetail.jsp");


		return forward;
	}

}
