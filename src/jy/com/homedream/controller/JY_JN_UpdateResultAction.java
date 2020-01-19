package jy.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jy.com.homedream.DTO.JY_JN_BoardDTO;
import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_UpdateResultAction implements Action {

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
		
		
		
		String num = multi.getParameter("bno");
		

		int bno = 1;
		
		if(num!=null) {
			bno=Integer.parseInt(num);
		}
		
		System.out.println(bno);
		
		JY_JN_Service service = JY_JN_Service.getService();
		JY_JN_BoardDTO dto = service.jn_getSelect(bno);
		
		System.out.println(dto.getBcontent());
		System.out.println(dto.getBtitle());
		
		String btitle = multi.getParameter("btitle");
		String bcontent = multi.getParameter("bcontent");
		
		dto.setBtitle(btitle);
		dto.setBcontent(bcontent);
		dto.setFile_name(file);
		
		service.jn_getUpdate(dto);
	
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("detail.do?num="+bno);
		
		return forward;
	}

}
