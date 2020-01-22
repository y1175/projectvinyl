package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.QuestionDTO;
import com.homedream.service.QuestionService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QuestionUpdateResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward=new ActionForward();
		int filesize=1024*1024*10; // 파일올라가는 사이즈
		String uploadpath=request.getServletContext().getRealPath("upload");
		MultipartRequest multi=new MultipartRequest(request, uploadpath, filesize, "utf-8", new DefaultFileRenamePolicy());
		
		String file=multi.getFilesystemName("uploadfile");
		
		request.setAttribute("file", file);
		
		String no=multi.getParameter("q_no");
		
		int q_no=1;
		if(no!=null && !("".equals(no))) {
			q_no=Integer.parseInt(no);
		}
		
		QuestionService service=QuestionService.getService();
		QuestionDTO dto=service.detailSelect(q_no);
		
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFilename(file);
		
		service.questionUpdate(dto);
		
		forward.setForward(true);
		forward.setUrl("questiondetail.do?num="+q_no);
		
		return forward;
	}

}
