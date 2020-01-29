package ej.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import ej.com.homedream.service.EJMemberService;

public class  EJInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String addpoint1=request.getParameter("addpoint");//얘는 insert.jsp에서받음
		String memno1=request.getParameter("what");//list jsp에서 받은거
		int addpoint=0; 
		int memno=0;
		
		if(addpoint1!=null&&!"".equals(addpoint1))
			addpoint=Integer.parseInt(addpoint1);
		if(memno1!=null&&!"".equals(memno1))
			memno=Integer.parseInt(memno1);
		System.out.println("인설트 액션에서 point"+addpoint);
		System.out.println(" 인설트 액션에서 memno: "+memno);
		EJMemberService service=EJMemberService.getService();
		//service.update(memno);
		service.insert(memno,addpoint);
		
		/*ActionForward f=new ActionForward();
		f.setForward(true);*///forward로 페이지이동 
		/*f.setUrl("/ej_member/ej_insert.jsp");*///얘는 바로 .do로
		/*f.setUrl("ej_list.do");*/
		/*f.setUrl("/ej_member/ej_list.jsp");*/
		//얘또 넘겨줘 
		//forward는 setAttributem로
	
		/*return f;*/
		ActionForward f=new ActionForward();
		f.setForward(false);//forward로 페이지이동 높 send redirect로 해
		f.setUrl("ej_list.do");//얘는 바로 .do로
		request.setAttribute("memNo", memno1);
		return f;
		
	}

}
