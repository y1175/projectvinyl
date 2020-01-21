package ej.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import ej.com.homedream.service.MemberService;

public class  InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String addpoint1=request.getParameter("addpoint");//얘는 insert.jsp에서받음
		String memno1=request.getParameter("memNo");//list jsp에서 받은거
		int addpoint=0; 
		int memno=0;
		
		if(addpoint1!=null&&!"".equals(addpoint1))
			addpoint=Integer.parseInt(addpoint1);
		if(memno1!=null&&!"".equals(memno1))
			memno=Integer.parseInt(memno1);
		System.out.println("point"+addpoint);
		System.out.println("memno이다이다: "+memno);
		MemberService service=MemberService.getService();
		//service.update(memno);
		service.insert(memno,addpoint);
		
		ActionForward f=new ActionForward();
		f.setForward(true);//forward로 페이지이동 
		f.setUrl("/ej_member/ej_insert.jsp");//얘는 바로 .do로
		//f.setUrl("ej_list.do");
		request.setAttribute("memNo", memno1);//얘또 넘겨줘 
		//forward는 setAttributem로
	
		return f;
		
	}

}
