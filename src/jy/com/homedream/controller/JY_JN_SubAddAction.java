package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.DTO.JY_JN_SubBoardDTO;
import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_SubAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String subcontent = request.getParameter("subcontent");
		
		JY_JN_SubBoardDTO subdto = new JY_JN_SubBoardDTO();
		
		subdto.setBno(num);
		subdto.setMem_no(58);
		subdto.setSubcontent(subcontent);
		
		JY_JN_Service service = JY_JN_Service.getService();
		String subid = service.jn_getAddSubBoard(subdto);
		
		request.setAttribute("subid", subid);
		
		ActionForward forward =	new ActionForward();
		forward.setForward(true);
		forward.setUrl("jy_detail.do?num="+num);
		
		return forward;
	}

}
