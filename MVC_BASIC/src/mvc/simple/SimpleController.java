package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	//컨트롤러 서블릿의 전형적인 구현 방법
	// 1단계 : HTTP 요청받음
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			proceessRequest(request, response);
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	private void proceessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2단계 : 요청파악
		// request 객체로부터 사용자의 요청을 파악하는 소스 코딩
		String type = request.getParameter("type");
		
		//3단계 : 요청한 기능을 수행합니다.
		// 사용자의 요청에 따라 알맞은 코드 처리함
		Object resultObject = null;
		if(type == null || type.equals("greeting")) {
			resultObject = "안녕하세요";
		} else if(type.equals("date")) {
			resultObject = new java.util.Date();
		} else {
			resultObject = "Invalid Type : 유효하지 않은 타입입니다.";
		}
		
		// 4단계 : request나 session에 처리 결과를 저장 처리함
		request.setAttribute("result", resultObject);
		
		// 5단계 : RequestDispatcher를 사용하여 알맞은 뷰로 포워딩 처리합니다.
		RequestDispatcher dispatcher = request.getRequestDispatcher("/simpleView.jsp");
		
		dispatcher.forward(request, response);
	}
}
