package ex02;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//파일 다운로드 기능을 수행할 서블릿인 FileDownload 클래스를 재작합니다.
//파일 다운로드 기능은 자바 IO를 이용해서 구현합니다.
//먼저 response.getOutputStream() 메서드를 호출해서
//OutputStream을 가져옵니다.
//그리고, 배열로 버퍼를 만든 후 while 반복문을 이용해
//파일에서 데이터를 한 번호에 8KB씩 버퍼에 읽어옵니다.
//이어서 OutputStream의 write() 메서드를 이용해서
//다시 브라우저로 출력합니다.

@WebServlet("/donwload.do")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String file_repo = "C:\\file_repo";
		
		// 매개 변수로 전송된 파일 이름을 읽어옵니다.
		String fileName = (String) request.getParameter("fileName");
		System.out.println("fileName = " + fileName);
		
		// response에서 OutputStream 객체를 가져옵니다.
		OutputStream out = response.getOutputStream();
		String downFile = file_repo + "\\" + fileName;
		File f= new File(downFile);
		
		// 파일을 다운로드할 수 있습니다
		response.setHeader("Cache-Control", "no-Cache");
		response.addHeader("Content-disposition","attachment; fileName=" + fileName);
		FileInputStream in = new FileInputStream(f);
		
		// 버퍼 기능을 이용해 파일에서 버퍼로 데이터를 읽어와서 한꺼번에 출력처리합니다.
		
		byte[] buffer = new byte[1024*8]; // 8Kb 버퍼 처리 공간 생성
		while (true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}
