package hm.com.homedream.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;

import hm.com.homedream.dto.Hm_ExpertDTO;
import hm.com.homedream.service.Hm_ExpertService;

public class Hm_ManagerListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("hmcity");
		if(search==null)
		{
			search="";
		}
		
		Hm_ExpertService service = Hm_ExpertService.getService();
		
		
		int currpage = 1;//현재페이지
		String curr = request.getParameter("curr");
		if(curr!=null)
		{
			currpage = Integer.parseInt(curr);
		}
		int totalcount = service.getCount(search);
		
		
		int pagepercount = 5;//한 페이지 당 보여줄 자료
		int totalpage = (int)Math.ceil((float)totalcount/pagepercount);
		
		int startrow = (currpage-1)*pagepercount+1;
		int endrow = startrow+pagepercount-1;
		if(endrow>totalcount)
		{
			endrow=totalcount;
		}
		int pageblockcount =5;
		int startblock =((currpage-1)/pageblockcount)*pageblockcount+1;
		int endblock = startblock+pageblockcount-1;
		if(endblock>totalpage)
		{
			endblock =totalpage;
		}
		
		request.setAttribute("currpage", currpage);
		request.setAttribute("startblock", startblock);
		request.setAttribute("endblock", endblock);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("search", search);
		request.setAttribute("totalcount", totalcount);

		List<Hm_ExpertDTO> list =service.getList(currpage,pagepercount,search);//전체리스트
		
		
		
		
		request.setAttribute("list", list);
		ActionForward forward = new ActionForward();
		forward.setForward(true);
		forward.setUrl("/hs_communityadminmain.jsp?page=hm_expert/hm_managerlist.jsp");
		
		
		return forward;
	}

}
