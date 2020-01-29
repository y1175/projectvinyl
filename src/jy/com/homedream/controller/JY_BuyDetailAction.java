package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.DTO.JY_ItemDTO;
import jy.com.homedream.DTO.JY_JN_MemberDTO;
import jy.com.homedream.service.JY_BuyService;

public class JY_BuyDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
JY_BuyService service = JY_BuyService.getService();
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/jy_buydetail.jsp");
		
		return forward;
	}

}
