package yi.com.homedream.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.dto.OrderlistDTO;
import yi.com.homedream.service.MemberService;

public class YIOrderlistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("userId");
		ActionForward f=new ActionForward();
		if(id==null)
		{
			f.setForward(false);
			f.setUrl("yilogin.do");
			
		}
		else
		{
			List<OrderlistDTO> list=new ArrayList<>();
			MemberService service=MemberService.getService();
			list=service.orderlist(id);
			request.setAttribute("list", list);
			
			f.setForward(true);
			f.setUrl("/yi_member/orderlist.jsp");
		}
		
		return f;
	}

	
}