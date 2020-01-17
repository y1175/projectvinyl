package hm.com.homedream.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hm.com.homedream.dto.Hm_ExpertDTO;
import hm.com.homedream.service.Hm_ExpertService;

public class Hm_ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		Hm_ExpertService service = Hm_ExpertService.getService();
		List<Hm_ExpertDTO> list =service.getList();
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/WEB-INF/hm_expert/hm_list.jsp");
		
		
		return forward;
	}

}
