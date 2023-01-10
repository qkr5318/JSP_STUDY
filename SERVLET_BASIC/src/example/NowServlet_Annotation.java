package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet(urlPatterns = "/nowAnno")
// urlPatterns는 2개이상 적용이 가능합니다. : {"/nowAnno", "/nowRun.do"}


//@WebServlet(urlPatterns = {"/nowAnno", "/nowRun.do"})
	@WebServlet(urlPatterns = "/nowAnno")
	//web.xml없이 구동하기
	
public class NowServlet_Annotation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head><title>현재시간</title></head>");
			out.println("<body>");
			out.println("NowServlet_Annotation 현재시간");
			out.println(new Date());
			out.println("!입니다.");
			out.println("</body></html>");
	
	}

}
