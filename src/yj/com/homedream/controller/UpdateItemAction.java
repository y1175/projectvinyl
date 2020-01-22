package yj.com.homedream.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yj.com.homedream.dto.CategoriDTO;
import yj.com.homedream.dto.ItemDTO;
import yj.com.homedream.service.ItemService;

public class UpdateItemAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {

		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		ItemService service = ItemService.getInstance();
		ItemDTO dto = service.getDetail(itemNo);
		List<CategoriDTO> list = service.getCategori();
		
		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		request.setAttribute("itemNo", itemNo);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/hs_storeadminmain.jsp?page=yj/updateItem.jsp");
		return forward;
	}

}
