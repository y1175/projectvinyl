package hm.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hm.com.homedream.dto.Hm_ExpertDTO;
import hm.com.homedream.service.Hm_ExpertService;

public class Hm_UploadResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		int filesize = 1024 * 1024 * 10;
		String uploadpath = request.getServletContext().getRealPath("upload");
		MultipartRequest multi = new MultipartRequest(request, uploadpath, filesize, "utf-8",
				new DefaultFileRenamePolicy());

		String file_name = multi.getParameter("file_name");
		String file = multi.getFilesystemName("uploadfile");
		
		String name = multi.getParameter("name");
		String text = multi.getParameter("content");
		String place = multi.getParameter("place");
		String lat = multi.getParameter("lat");
		String lon = multi.getParameter("lon");
		String addr = multi.getParameter("addr");
		
		
		Hm_ExpertDTO dto = new Hm_ExpertDTO();
		dto.setName(name);
		dto.setText(text);
		dto.setPlace(place);
		dto.setLat(lat);
		dto.setLon(lon);
		dto.setFile_name(file);
		dto.setAddr(addr);
	
		
		System.out.println(name);
		System.out.println(file_name);
		System.out.println(file);
		
		String origin = multi.getOriginalFileName("uploadfile");
		request.setAttribute("dto", dto);
		request.setAttribute("origin", origin);
		request.setAttribute("file", file);
		System.out.println(uploadpath + "/" + file);
		Hm_ExpertService service = Hm_ExpertService.getService();
		service.dataInsert(dto);
		ActionForward f = new ActionForward();
		f.setForward(true);
		f.setUrl("hm_list.do");
		return f;
	}

}
