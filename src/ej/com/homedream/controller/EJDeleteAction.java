package ej.com.homedream.controller;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import ej.com.homedream.service.EJMemberService;

public class EJDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memno1=request.getParameter("memNo");
		int memno=Integer.parseInt(memno1);
		System.out.println("memno:"+memno);
		
		EJMemberService service=EJMemberService.getService();
		service.delete(memno);
		
		//forward로 넘기기
		ActionForward f=new ActionForward();
		f.setForward(false);//forward로 페이지이동 높 send redirect로 해
		f.setUrl("ej_list.do");//얘는 바로 .do로
		
		return f;
		
	}

}
