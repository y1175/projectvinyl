package com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.ExpertDTO;
import com.homedream.service.ExpertService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ExpertUploadResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int filesize = 1024 * 1024 * 10;
		String uploadpath = request.getServletContext().getRealPath("upload");
		MultipartRequest multi = new MultipartRequest(request, uploadpath, filesize, "utf-8",
				new DefaultFileRenamePolicy());
		
	   
		String file = multi.getFilesystemName("uploadfile");
		
		String name = multi.getParameter("name");
		String text = multi.getParameter("content");
		String place = multi.getParameter("place");
		String lat = multi.getParameter("lat");
		String lon = multi.getParameter("lon");
		String addr = multi.getParameter("addr");
		
		
		ExpertDTO dto = new ExpertDTO();
		dto.setName(name);
		dto.setText(text);
		dto.setPlace(place);
		dto.setLat(lat);
		dto.setLon(lon);
		dto.setFile_name(file);
		dto.setAddr(addr);
	

		
		String origin = multi.getOriginalFileName("uploadfile");
		request.setAttribute("dto", dto);
		request.setAttribute("origin", origin);
		request.setAttribute("file", file);
		
		ExpertService service = ExpertService.getService();
		service.dataInsert(dto);
		ActionForward f = new ActionForward();
		f.setForward(true);
		f.setUrl("expertmanagerlist.do");
		return f;
	}

}
