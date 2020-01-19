package yi.com.homedream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.dto.ItemDTO;
import yi.com.homedream.dto.MemberDTO;
import yi.com.homedream.dto.OrderlistDTO;
import yi.com.homedream.service.MemberService;

public class YIOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		List<ItemDTO> item=new ArrayList<>();
		List<OrderlistDTO> order=new ArrayList<>();
		List<MemberDTO> member=new ArrayList<>();
		MemberService service=MemberService.getService();
		member=service.orderDetailMember(num);
		item=service.orderDetailItem(num);
		order=service.orderDetailOrder(num);
		request.setAttribute("items", item);
		request.setAttribute("member", member);
		request.setAttribute("order", order);
		
		
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/yi_member/orderdetail.jsp?num="+num);
		return f;
	}

}
