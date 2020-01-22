package hs.com.homedream.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		//session을 적용하려면 Action에서 수정하면된다.

		HttpSession session=request.getSession();
				String mem_id = (String) session.getAttribute("id");
		      int mem_no=(int)session.getAttribute("mem_no");
		      ActionForward f=new ActionForward();
		      if(mem_id==null)   //세션이 없으면 로그인화면으로 넘어간다
		      {
		         f.setForward(false);
		         f.setUrl("yilogin.do");
		         
		      }
		      else   //id!=null, 즉 아이디가 있으면..
		      {
		    	  QuestionDTO dto=new QuestionDTO();
		    	  dto.setMem_no(mem_no);
		  		  dto.setTitle(title);
		  		  dto.setContent(content);
		  		  dto.setFilename(file);
		  		
		  		  QuestionService service=QuestionService.getService();
		  		service.getInsertUpload(dto);
		         
		         
		         f.setForward(true);
		         f.setUrl("hs_questionlist.do");
		      }



		//세션값을 저장하고 싶으면 
		//request.setAttribute("session", Integer.parseInt(mem_no));
		//이후 session으로 request값을 호출하면 됨. (session값은 mem_no임)
		
		
		
		/*forward.setForward(true);
		forward.setUrl("hs_questionlist.do");*/
		return forward;
	}

}
