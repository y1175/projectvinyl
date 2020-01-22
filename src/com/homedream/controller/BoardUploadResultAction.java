package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.BoardDTO;
import com.homedream.service.BoardService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardUploadResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int filesize = 1024 * 1024 * 10;
		String uploadpath = request.getServletContext().getRealPath("upload");
		System.out.println(uploadpath);
		MultipartRequest multi = new MultipartRequest(request, uploadpath, filesize, "utf-8",
				new DefaultFileRenamePolicy());

		//String title = multi.getParameter("title");
		String file = multi.getFilesystemName("uploadfile");
		//String origin = multi.getOriginalFileName("uploadfile");
		
		//request.setAttribute("title", title);
		request.setAttribute("file", file);
		//request.setAttribute("origin", origin);

		System.out.println(uploadpath + "/" + file);
		
		
		String btitle = multi.getParameter("btitle");
		String bcontent = multi.getParameter("bcontent");
		System.out.println(btitle);
		System.out.println(bcontent);
		
		BoardDTO dto = new BoardDTO();
		dto.setBtitle(btitle);
		dto.setBcontent(bcontent);
		dto.setFile_name(file);
		
		BoardService service = BoardService.getService();
		service.getUpload(dto);
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("list.do");
		
		 
		return forward;
	}

}
