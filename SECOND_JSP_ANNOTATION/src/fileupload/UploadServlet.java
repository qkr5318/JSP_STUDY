package fileupload;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// 서블릿 매핑을 위해 @WebServlet 애노티이션을 사용해서 url-pattern을 /upload로 처리함
//서블릿 파일 업로드를 @MultipartConfig 애노테이션을 사용해서 설명함(web.xml 파일이 필요가 없음)
@WebServlet("/upload")
@MultipartConfig(
		maxFileSize = -1,
		maxRequestSize =  -1)

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		writer.println("<html><body>");
		
		//요청 컨텐츠 타입이 multipart/form-data 인지 확인합니다.
		String contentType = request.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(request, writer);
		}else {
			writer.println("multipart가 아닙니다.");
		}
		writer.println("</body></html>");
		
	}

	private void printPartInfo(HttpServletRequest request, PrintWriter writer) throws IOException, ServletException {
		
		// HttpServletRequest의 getParts() 메서드를 이용해서 Part 목록을 구합니다.
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			// Part의 getName() 메서드를 이용해서 name(이름) <input> 태그의 name 속성값을 구합니다.
			writer.println("<br /> name = " + part.getName());
			// Part의 컨텐츠 타입(contentType)을 get(얻어와서) 출력합니다.
			String contentType = part.getContentType();
			writer.println("<br /> contentType = " + contentType);
            // Part의 Content-Disposition 헤더가 "filename="을 contains(포함하고 있으면)
            // 파일에 해당하므로 업로드한 파일 데이터를 처리합니다.
            // 일반 HTTP 응답에서 Content-Disposition 응답 헤더는
            // 콘텐츠가 브라우저에 인라인 으로 표시되어야 하는지,
            // 즉 웹 페이지나 웹 페이지의 일부 또는 첨부 파일로 표시되는지
            // 여부를 나타내는 헤더 입니다. 다운로드되어 로컬에 저장됩니다.
			if (part.getHeader("Content-Disposition").contains("filename=")) {
				// part.getSize()로 업로드한 파일의 Size(크기)를 구합니다.
				writer.println("<br /> size = " + part.getSize());
				//part,getSubmittedFileName() 메서드로 fileName 구합니다.
				String fileName = part.getSubmittedFileName();
				writer.println("<br /> filename = " + fileName);
				//part.getSize()가 0보다 크다면
				if (part.getSize() > 0) {
					//part.write(String filename) 메서드를 이용해서
					// 업로드 데이터를 fileName에 해당하느 파일에 기록을 합니다.
					part.write("c:\\temp\\" + fileName);
				}
			}else {
				// 파일 업로드가 아닌 경우 HttpServletRequest의 getParameter()를 이용해서
				// 파라미터값을 구합니다. 이떄, 파라미터 이름으로 part.getName()을 사용합니다.
				String value = request.getParameter(part.getName());
				writer.println("<br /> value = " + value);
			}
			writer.println("<hr />");
			
			
		}
		
	}

}
