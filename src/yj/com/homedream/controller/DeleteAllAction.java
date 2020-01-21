package yj.com.homedream.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yj.com.homedream.service.ItemService;



public class DeleteAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {
		String[] arr = request.getParameterValues("num");
		
		ItemService.getInstance().deletAll(arr);
		
		ActionForward forward = new ActionForward();
		forward.setForward(false);
		forward.setUrl("yj_itemlist.do");
		return forward;
	}

}
