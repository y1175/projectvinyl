package com.homedream.comm;

import java.io.FileReader;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */

@WebServlet(urlPatterns= {"*.do"},initParams = {@WebInitParam(name = "init", value = "/WEB-INF/prop.properties")})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public FrontController() {
        // TODO Auto-generated constructor stub
    }
    private Hashtable<String, Action> ht=new Hashtable<>();
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	String initial=config.getInitParameter("init");
    	Properties prop=new Properties();
    	
    	try {
    		String path=config.getServletContext().getRealPath(initial);
    		prop.load(new FileReader(path));
    		Enumeration enu=prop.keys();
    		while(enu.hasMoreElements())
    		{
    			String key=(String)enu.nextElement();
    			String value=prop.getProperty(key);
    			Class c=Class.forName(value);
    			Action obj=(Action)c.newInstance();
    			ht.put(key, obj);
    		}
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println(e);
    	}
    	
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReq(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doReq(request, response);
	}
	private void doReq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path=request.getServletPath();
		Action act=null;
	
		act=ht.get(path);
		System.out.println(act);
		
		
		ActionForward forward=act.execute(request, response);
		if(forward.isForward())
		{
			RequestDispatcher disp=request.getRequestDispatcher(forward.getUrl());
			disp.forward(request, response);
		}
		else
		{
			response.sendRedirect(forward.getUrl());
		}
		
	}

}
