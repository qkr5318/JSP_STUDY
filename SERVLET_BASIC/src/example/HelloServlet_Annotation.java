package example;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 urlPatterns를 /hello 로 web.xml 셋팅해서
// name 속성의 파라미터값은 jangnara로 해서 웹페이지를 로딩해 보기

@WebServlet(urlPatterns = {"/helloda", "/helloda.do"})
public class HelloServlet_Annotation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head><title>환영합니다.</title></head>");
			out.println("<body>");
			out.println("안녕하세요");
			out.println(request.getParameter("name"));
			out.println("님 환영합니다");
			out.println("</body></html>");
	
	}

}
