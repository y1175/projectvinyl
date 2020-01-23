package jy.com.homedream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jy.com.homedream.DTO.JY_JN_SubBoardDTO;
import jy.com.homedream.service.JY_JN_Service;

/**
 * Servlet implementation class JY_JN_SubDetailAction
 */
@WebServlet("/jy_subdetail.do")
public class JY_JN_SubDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public JY_JN_SubDetailAction() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReq(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReq(request, response);
	}
	
	private void doReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		HttpSession session = request.getSession();
		int mem_no = (int)session.getAttribute("mem_no");
		
		JY_JN_Service service = JY_JN_Service.getService();
		List<JY_JN_SubBoardDTO>list = service.jn_getDetailSubBoard(num,mem_no);
		
		System.out.println(mem_no);
		
		JSONArray arr = new JSONArray();
		for(JY_JN_SubBoardDTO dto : list) {
			JSONObject o = new JSONObject();
			o.put("rno", dto.getRno());
			o.put("bno", dto.getBno());
			o.put("content", dto.getSubcontent());
			o.put("mem_no", dto.getMem_no());
			o.put("id", dto.getSubid());
			arr.add(o);
			// dto를 풀어서 다시 o로 만듬 > 그다음에 그걸 arr에 넘김
		}
		
		PrintWriter out = response.getWriter();
		// 화면에 출력하려면 out객체가 필요하지
		out.print(arr);
		System.out.println(arr);
		
	}

		
}


