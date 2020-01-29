package ej.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import ej.com.homedream.service.EJOrderService;



public class EJUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("updateActon!!!");
		String status1=request.getParameter("status");//
		String orderno1=request.getParameter("what");//
		System.out.println("status"+status1);
		System.out.println("orderno: "+orderno1);
		int status=0; 
		int orderno=0;
		
		if(status1!=null&&!"".equals(status1))
			status=Integer.parseInt(status1);
		if(orderno1!=null&&!"".equals(orderno1))
			orderno=Integer.parseInt(orderno1);
		
		EJOrderService service=EJOrderService.getService();
		
		service.update(orderno,status);
		/*
		ActionForward f=new ActionForward();
		f.setForward(true);//forward로 페이지이동 
		f.setUrl("/ej_order/ej_update.jsp");//얘는 바로 .do로
		//f.setUrl("ej_list.do");
		
		//forward는 setAttributem로
	
		return f;*/
		request.setAttribute("orderno", orderno);
		/*샌드리다이렉*/
		ActionForward f=new ActionForward();
		f.setForward(false);//forward로 페이지이동 높 send redirect로 해
		f.setUrl("ej_orderlist.do");//얘는 바로 .do로
		//얘또 넘겨줘 
		return f;
		
		/*ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("ej_update.do");
		request.setAttribute("orderno", orderno);
		return f;
		*/
	}

}
