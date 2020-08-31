package com.doposts.servlet;

import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

public abstract class AbstractServlet extends HttpServlet {
	public abstract Class<?> getServletClass();

	
	@Override
	protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		Method method = null;
		Object result = null;
		String url=(String) this.getInitParameter("url");
		if (action == null || action.equals("")) {
			
			if(url!=null)
			{
				request.getRequestDispatcher("/view/"+url+"/index.jsp").forward(request,
						response);
			}
			else
			{
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
			}
			
		} else {
			try {
				method = getServletClass().getDeclaredMethod(
						action,
						new Class[] { HttpServletRequest.class,
								HttpServletResponse.class });
				result = method
						.invoke(this, new Object[] { request, response });
				toView(request, response, result);
			} catch (NoSuchMethodException e) {
				request.getRequestDispatcher("404.jsp").forward(request,
						response);
				e.printStackTrace();
			} catch (Exception e) {
				// 500
				// ReturnResult
				e.printStackTrace();
			}

		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	public void toView(HttpServletRequest request,
                       HttpServletResponse response, Object result) throws Exception {
		if (result != null) {
			if (result instanceof String) {
				String viewName = "/WEB-INF/views/"+result.toString() + ".jsp";
				request.getRequestDispatcher(viewName).forward(request,
						response);

			} else {
				write(result, response);
			}
		}
	}

	public void write(Object object, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		
		String json = JSON.toJSONString(object);
		PrintWriter writer = null;
		if (response != null) {
			try {
				writer = response.getWriter();
				writer.print(json);
				writer.flush();
			} catch (IOException e) {
			
				e.printStackTrace();
			} finally {
				writer.close();
			}
		}
	}
}
