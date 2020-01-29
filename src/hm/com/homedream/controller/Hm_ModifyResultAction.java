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
		String uploadpath = request.getServletContext().getRealPath("upload");
	
		MultipartRequest multi = new MultipartRequest(request, uploadpath, filesize, "utf-8",
				new DefaultFileRenamePolicy());

		String file = multi.getFilesystemName("uploadfile");
		
		String num = multi.getParameter("no");
		int no =1;
		if(num!=null) {
			no=Integer.parseInt(num);
		}
		request.setAttribute("file", file);
		
		Hm_ExpertService service = Hm_ExpertService.getService();
		Hm_ExpertDTO dto = service.getSelect(no);

		service.dataUpdate(dto);
		
		request.setAttribute("dto", dto);
		
		
		
		ActionForward f = new ActionForward();
		f.setForward(true);
		f.setUrl("hm_managerdetail.do?no="+no);
		return f;
	}

}
