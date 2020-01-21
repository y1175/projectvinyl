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

public class Hm_ModifyResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int filesize = 1024 * 1024 * 10;
		String uploadpath = request.getServletContext().getRealPath("hm_expert");
	
		MultipartRequest multi = new MultipartRequest(request, uploadpath, filesize, "utf-8",
				new DefaultFileRenamePolicy());

		String file = multi.getFilesystemName("uploadfile");
		
		String num = multi.getParameter("no");
		int no =1;
		if(num!=null) {
			no=Integer.parseInt(num);
		}
		
		String name = multi.getParameter("name");
		String text = multi.getParameter("content");
		String place = multi.getParameter("place");
		String lat = multi.getParameter("lat");
		String lon = multi.getParameter("lon");
		String addr = multi.getParameter("addr");
		
		Hm_ExpertService service = Hm_ExpertService.getService();
		
		Hm_ExpertDTO dto = new Hm_ExpertDTO();
		dto.setNo(no);
		dto.setName(name);
		dto.setText(text);
		dto.setPlace(place);
		dto.setLat(lat);
		dto.setLon(lon);
		dto.setFile_name(file);
		dto.setAddr(addr);

		service.dataUpdate(dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("file", file);
		
		
		ActionForward f = new ActionForward();
		f.setForward(true);
		f.setUrl("hm_managerdetail.do?no="+no);
		return f;
	}

}
