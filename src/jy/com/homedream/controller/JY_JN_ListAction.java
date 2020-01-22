package jy.com.homedream.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import jy.com.homedream.DTO.JY_JN_BoardDTO;
import jy.com.homedream.service.JY_JN_Service;

public class JY_JN_ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String search = request.getParameter("search");
		String searchtxt = request.getParameter("searchtxt");
		
		if (search==null) {
			search="";
		} 
		
		if(searchtxt==null) {
			searchtxt="";
		}
		
		String sorting = request.getParameter("sorting");	
		
		if(sorting==null) {
			sorting="";
		}
		
		
		JY_JN_Service service = JY_JN_Service.getService();
		
		int totalconut = service.jn_getTotalCount(search,searchtxt);
		System.out.println(totalconut);
		
		int totalpage = (int)Math.ceil((double)totalconut/15);
		System.out.println(totalpage);
		
		int pagepersize = 15;
		
		int currpage = 1;
		// 첫 페이지가 null 일때 이게 동작함
		// null이 아니면 각각의 페이지 값이 나옴
		
		// int currpage = Integer.parseInt(request.getParameter("curr"));
		// 이게 안되는 이유 : 페이지가 null일때(첫번 페이지는 null임 > list.do한 순간)는 null이 나와서 에러 발생
		
		String curr = request.getParameter("curr");
		// 현재 페이지를 받아옴
		if(curr!=null) {
			currpage = Integer.parseInt(curr);
			// 즉, 널값일때는 1페이지가 나오고 널값이 아닐땐 각각의 페이지 값이 나옴
		}
		
		System.out.println("currpage = " + currpage);
	
		
		
		int startrow = (currpage-1)*pagepersize +1; // 한 페이지의 startrow > 1페이지의 1번글 2 페이지의 4번 글
		int endrow = startrow+pagepersize-1; // 한 페이지의 endrow > 1페이지의 3번 글, 2 페이지의 6번글
		
		if(endrow > totalconut) {
			endrow = totalconut;
		}
		
		// 페이지 블럭
		
		// 페이지에 한번에 보여줄 페이지 번호 갯수
		int pageblocksize = 5;
		// 첫번째 블럭 번호 > 1, 6, 11
		int startblock = ((currpage-1)/pageblocksize)*pageblocksize+1;
		// 마지막 블럭 번호 ? 6, 10, 15
		int endblock = startblock+pageblocksize-1;
		if(endblock>totalpage) {
			endblock = totalpage;
		}
		
		request.setAttribute("startblock", startblock);
		request.setAttribute("endblock", endblock);
		request.setAttribute("currpage", currpage);
		request.setAttribute("totalpage", totalpage);
		
		request.setAttribute("search", search);
		request.setAttribute("searchtxt", searchtxt);
		request.setAttribute("sorting", sorting);


		
        List<JY_JN_BoardDTO> jn_list = service.jn_getList(search, searchtxt,startrow, endrow,sorting);
		
		request.setAttribute("jn_list", jn_list);
		
		
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/hs_communitymain.jsp?page=jy_jn/jy_jn_list.jsp");
		
		return forward;
	}

}
