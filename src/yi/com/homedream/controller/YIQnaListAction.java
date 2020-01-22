package yi.com.homedream.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.homedream.comm.Action;
import com.homedream.comm.ActionForward;


import yi.com.homedream.dto.YIQuestionDTO;
import yi.com.homedream.service.YIMemberService;

public class YIQnaListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		int currpage=1;
		String curr=request.getParameter("curr");
		if(curr!=null)
		{
			currpage=Integer.parseInt(curr);
		}
		
				
		YIMemberService service=YIMemberService.getService();//BoardService에서 싱글톤패턴으로 짯엇음
		
		//구매액 상세검색
		int stxtsearch1=0;
		int stxtsearch2=0;
		
		String s1=request.getParameter("stxtsearch1");
		String s2=request.getParameter("stxtsearch2");
	
		if(s1!=null&&!"".equals(s1))
			stxtsearch1=Integer.parseInt(s1);
		
		if(s2!=null&&!"".equals(s2))
			stxtsearch2=Integer.parseInt(s2);
		
		System.out.println("stxtsearch1 & stxtsearch2"+stxtsearch1+stxtsearch2);
		
		
		//검색시작
				String search=request.getParameter("search");//list.jsp에서 받아오는것
				String txtsearch=request.getParameter("txtsearch");//list.jsp에서 받아오는것
						if(search==null)//null값처리
							search="";
						if(txtsearch==null)
							txtsearch="";
				//검색끝
		//페이징시작
		int totalcount=service.getCount(search, txtsearch);//전체자료
		System.out.println("totalcount: "+totalcount);
		int countperpage=15;//한페이지에 보여줄 자료
		int totalpage=(int)Math.ceil((float)totalcount/countperpage);
		int startrow=(currpage-1)*countperpage+1;
		int endrow=startrow+countperpage-1;
		if(endrow>totalcount) endrow=totalcount;

		//페이징 끝
		//블럭시작
		int blockcount=5;
		int startblock=((currpage-1)/blockcount)*blockcount+1;
		int endblock=startblock+blockcount-1;
		System.out.println("startblock:"+startblock);
		System.out.println("endblock:"+endblock);
		if(endblock>=totalpage) endblock=totalpage;
		//블럭끝	
		System.out.println("totalpage:"+totalpage);
		System.out.println("currpage:"+currpage);
		
		List<YIQuestionDTO> list=service.qnaList(startrow,endrow,search,txtsearch);//이건 걍 전체 가져오는거고(페이징으로)
		
		
		request.setAttribute("list", list);
		request.setAttribute("currpage", currpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startblock", startblock);
		request.setAttribute("endblock", endblock);
		request.setAttribute("search",search);
		request.setAttribute("txtsearch", txtsearch);
		//request.setAttribute("slist", slist);//2순위
		
		String[] sCheck=request.getParameterValues("select");
		//forward로 넘기기
		ActionForward f=new ActionForward();
		f.setForward(true);//forward로 페이지이동
		f.setUrl("/hs_communityadminmain.jsp?page=yi_member/qnaadmin.jsp");//ej_list.jsp로 넘김. 근데 얜 왜 jsp인지 모르겟음. 슬래시 써야함
		
		return f;
	}

}
