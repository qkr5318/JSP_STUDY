package ex01;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/upload.do")
public class fileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8";
		
		// 업로드할 파일 경로를 지정합니다.
		File currentDirPath = new File("c:\\file_repo");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		//파일 경로를 설정합니다. 즉, 파일을 저장할 디렉토리를 설정합니다. 
		factory.setRepository(currentDirPath);
		
		// 최대 업로드 가능한 파일 크기를 설정합니다.
		factory.setSizeThreshold(1024*1024);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			// request 객체에서 매개변수를 List로 가져옵니다.
			// 즉, parseRequest() 메서드는 전송된 매개변수를 List 객체로 얻습니다.
			List items = upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				// 파일 업로드 창에서 업로드된 항목들을 하나씩 가져옵니다.
				FileItem fileItem = (FileItem) items.get(i);
				
				// 폼 필드이면 전송된 매개변수 값을 출력합니다.
				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
					//폼 필드가 아니면(else문) 파일 업로드 기능을 수행합니다.
				} else {
					System.out.println("파라미터명 : " + fileItem.getFieldName());
					System.out.println("파일명 : " + fileItem.getName());
					System.out.println("파일 크기 : " + fileItem.getSize() + "bytes");
					
					// 업로드한 파일 이름을 가져옵니다.
					// 만약에 파일의 사이즈가 0보다 크다면 
					if(fileItem.getSize() > 0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						System.out.println("★★★" + fileItem.getName());
						System.out.println("@@@" + idx);
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx + 1);
						System.out.println("◎◎◎" + fileItem.getName());
						System.out.println("※※※" + fileName);
						// 업로드한 파일 이름으로 저장소에 파일을 업로드 처리 합니다.
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						fileItem.write(uploadFile);
						
					} // end if
				} // end else
			} // end for
		} catch (Exception e) {
			e.printStackTrace();
		}     
	}
}
