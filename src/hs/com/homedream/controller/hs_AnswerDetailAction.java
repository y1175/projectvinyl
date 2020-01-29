package hs.com.homedream.controller;

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

import hs.com.homedream.answer.AnswerDTO;
import hs.com.homedream.service.QuestionService;


@WebServlet("/hs_answerdetail.do")
public class hs_AnswerDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public hs_AnswerDetailAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReq(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReq(request, response);
	}
	
	private void doReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		int no=Integer.parseInt(request.getParameter("no"));
		System.out.println("È£µµ doreq"+no);
		
		QuestionService service=QuestionService.getService();
		List<AnswerDTO> list=service.getDetailList(no);
		
		JSONArray arr=new JSONArray();
		for(AnswerDTO dto:list) {
			JSONObject o=new JSONObject();
			o.put("a_no", dto.getA_no());
			o.put("q_no", dto.getQ_no());
			o.put("mem_no", dto.getMem_no());
			o.put("content", dto.getContent());
			o.put("answerid", dto.getAnswerid());
			arr.add(o);
		}
		PrintWriter out=response.getWriter();
		out.print(arr);	
		System.out.println(arr.size());
	}

}
