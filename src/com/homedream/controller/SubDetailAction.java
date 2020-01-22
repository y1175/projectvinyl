package com.homedream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.homedream.dto.SubBoardDTO;
import com.homedream.service.BoardService;
/**
 * Servlet implementation class SubDetailAction
 */
@WebServlet("/subdetail.do")
public class SubDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SubDetailAction() {
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
		
		BoardService service = BoardService.getService();
		List<SubBoardDTO>list = service.getDetailSubBoard(num);
		
		JSONArray arr = new JSONArray();
		for(SubBoardDTO dto : list) {
			JSONObject o = new JSONObject();
			o.put("rno", dto.getRno());
			o.put("bno", dto.getBno());
			o.put("content", dto.getSubcontent());
			o.put("mem_no", dto.getMem_no());
			o.put("subid", dto.getSubid());
			arr.add(o);
			// dto를 풀어서 다시 o로 만듬 > 그다음에 그걸 arr에 넘김
		}
		
		PrintWriter out = response.getWriter();
		// 화면에 출력하려면 out객체가 필요하지
		out.print(arr);
		System.out.println(arr);
		
	}

		
}


