package yj.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yj.com.homedream.dto.ItemDTO;
import yj.com.homedream.service.ItemService;

public class DetailItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ItemService service = ItemService.getInstance();
		ItemDTO dto = service.getDetail(10);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("yj_itemDetail.do");
		return forward;
	}

}
