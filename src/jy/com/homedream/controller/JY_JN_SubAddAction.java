package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.DTO.JY_JN_SubBoardDTO;
import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_SubAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session=request.getSession();
		int mem_no = (int) session.getAttribute("mem_no");
		System.out.println("댓글 넘어가는 인간번호" + mem_no);
		String subcontent = request.getParameter("subcontent");
		JY_JN_SubBoardDTO subdto = new JY_JN_SubBoardDTO();
		
		subdto.setBno(num);
		subdto.setMem_no(mem_no);
		subdto.setSubcontent(subcontent);
		
		JY_JN_Service service = JY_JN_Service.getService();
		String subid = service.jn_getAddSubBoard(subdto);
		
		subdto.setSubid(subid);
		
		request.setAttribute("subdto", subdto);
		
		ActionForward forward =	new ActionForward();
		forward.setForward(true);
		forward.setUrl("jy_detail.do?num="+num);
		
		return forward;
	}

}
