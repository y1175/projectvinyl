package hs.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hs.com.homedream.question.QuestionDTO;
import hs.com.homedream.service.QuestionService;

public class hs_QuestionInsertResultAction implements Action {

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
		
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		
		QuestionDTO dto=new QuestionDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFilename(file);
		
		QuestionService service=QuestionService.getService();
		service.getInsertUpload(dto);
		
		forward.setForward(true);
		forward.setUrl("hs_questionlist.do");
		return forward;
	}

}
