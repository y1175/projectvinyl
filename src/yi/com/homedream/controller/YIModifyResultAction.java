package yi.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import yi.com.homedream.dto.MemberDTO;
import yi.com.homedream.service.MemberService;

public class YIModifyResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
HttpSession session=request.getSession();
String memno=(String)session.getAttribute("userId");

		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String birth=request.getParameter("birth");
		String phone=request.getParameter("phone");
		int addrselect=Integer.parseInt(request.getParameter("addrselect"));
		
		String addr;
		
		if(addrselect==0)
		addr=request.getParameter("roadaddr");
		else
		addr=request.getParameter("jibunaddr");
		
		String detailaddr=request.getParameter("detailaddr");
		String fulladdr=addr+" "+detailaddr;
		
		int zipcode=Integer.parseInt(request.getParameter("zipcode"));
		
		
		MemberDTO dto=new MemberDTO();
		dto.setMemNo(Integer.parseInt(memno));
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setPhone(phone);
		dto.setAddr(fulladdr);
		dto.setZipcode(zipcode);
		
		
		MemberService service=MemberService.getService();
		service.modifyData(dto);
		
		ActionForward f=new ActionForward();
		f.setForward(false);
		f.setUrl("yi.do");
		return f;
	}

}
