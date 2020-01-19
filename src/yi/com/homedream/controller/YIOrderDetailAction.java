package yi.com.homedream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.dto.MemberDTO;
import yi.com.homedream.dto.OrderlistDTO;
import yi.com.homedream.service.MemberService;

public class YIOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		List<OrderlistDTO> item=new ArrayList<OrderlistDTO>();
		MemberDTO mdto=new MemberDTO();
		MemberService service=MemberService.getService();
		mdto=service.orderDetailMember(num);
		item=service.orderDetailItem(num);
		request.setAttribute("item", item);
		request.setAttribute("mdto", mdto);
		
		
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/yiorderdetail.do?num="+num);
		return f;
	}

}
