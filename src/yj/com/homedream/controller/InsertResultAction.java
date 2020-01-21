package yj.com.homedream.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import yj.com.homedream.dto.ItemDTO;
import yj.com.homedream.service.ItemService;

public class InsertResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws SecurityException, IOException {

		int filesize = 1024 * 1024 * 10;
		String uploadpath = request.getServletContext().getRealPath("img");
		MultipartRequest multi =new MultipartRequest(request, uploadpath, filesize, "utf-8", new DefaultFileRenamePolicy());
		
		String file = multi.getFilesystemName("fileupload");
		int cNo = Integer.parseInt(multi.getParameter("categori"));
		String company = multi.getParameter("company");
		String content = multi.getParameter("content");
		String name = multi.getParameter("name");
		int price = Integer.parseInt(multi.getParameter("price"));
		int stock = Integer.parseInt(multi.getParameter("stock"));
		int sale = Integer.parseInt(multi.getParameter("sale"));
		
		ItemDTO dto = new ItemDTO();
		dto.setFileName(file);
		dto.setName(name);
		dto.setCompany(company);
		dto.setCNo(cNo);
		dto.setContent(content);
		dto.setPrice(price);
		dto.setStock(stock);
		dto.setSale(sale);
		
		ItemService service = ItemService.getInstance();
		service.insertItem(dto);
		
		
		ActionForward forward = new ActionForward();
		forward.setForward(false);
		forward.setUrl("yj_itemlist.do");
		return forward;
	}

}
