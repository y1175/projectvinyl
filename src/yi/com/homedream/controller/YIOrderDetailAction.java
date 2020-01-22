package yi.com.homedream.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.dto.YIItemDTO;
import yi.com.homedream.dto.YIMemberDTO;
import yi.com.homedream.dto.YIOrderlistDTO;
import yi.com.homedream.service.YIMemberService;

public class YIOrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		List<YIItemDTO> item=new ArrayList<>();
		List<YIOrderlistDTO> order=new ArrayList<>();
		List<YIMemberDTO> member=new ArrayList<>();
		YIMemberService service=YIMemberService.getService();
		member=service.orderDetailMember(num);
		item=service.orderDetailItem(num);
		order=service.orderDetailOrder(num);
		request.setAttribute("items", item);
		request.setAttribute("member", member);
		request.setAttribute("order", order);
		
		
		ActionForward f=new ActionForward();
		f.setForward(true);
		f.setUrl("/hs_communitymain.jsp?page=yi_member/orderdetail.jsp?num="+num);
		return f;
	}

}
