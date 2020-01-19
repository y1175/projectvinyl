package ej.com.homedream.controller;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

public class DeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sCheck[]=request.getParameterValues("h");
		System.out.println("sCheck:"+sCheck);
		//forward로 넘기기
		ActionForward f=new ActionForward();
		f.setForward(true);//forward로 페이지이동
		f.setUrl("/ej_member/delete.jsp");//ej_list.jsp로 넘김. 근데 얜 왜 jsp인지 모르겟음. 슬래시 써야함
		
		return f;
		
	}

}
