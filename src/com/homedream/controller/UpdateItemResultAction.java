package com.homedream.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;
import com.homedream.dto.ItemDTO;
import com.homedream.service.ItemService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateItemResultAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws SecurityException, IOException {
      int filesize = 1024 * 1024 * 10;
      String uploadpath = request.getServletContext().getRealPath("img");
      MultipartRequest multi =new MultipartRequest(request, uploadpath, filesize, "utf-8", new DefaultFileRenamePolicy());
      
      String file = multi.getFilesystemName("fileupload");
      int cNo = Integer.parseInt(multi.getParameter("categori"));
      String sale = multi.getParameter("sale");
      
      String company = multi.getParameter("company");
      String content = multi.getParameter("content");
      String name = multi.getParameter("name");
      int price = Integer.parseInt(multi.getParameter("price"));
      int stock = Integer.parseInt(multi.getParameter("stock"));
      int itemNo = Integer.parseInt(multi.getParameter("itemNo"));
      
      ItemDTO dto = new ItemDTO();
      
      if(file != null) {
         dto.setFileName(file);         
      }
      
      dto.setName(name);
      dto.setCompany(company);
      dto.setContent(content);
      dto.setPrice(price);
      dto.setStock(stock);
      dto.setSale(Integer.parseInt(sale));         
      dto.setCNo(cNo);
      dto.setItemNo(itemNo);
      
      ItemService service = ItemService.getInstance();
      service.updateItem(dto);
      
      ActionForward forward = new ActionForward();
      forward.setForward(false);
      forward.setUrl("itemlist.do");
      return forward;
   }

}