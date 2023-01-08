package sec02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

//JSON 배열에 회원 정보를 저장하여 JSP 페이지로 전송하고,
//JSON 배열에 정보를 저장하는 과정은 다음과 같습니다.
//첫번째 : memberInfo로 JSONObject 객체를 생성한 후
//     회원 정보를 name/value 쌍으로 저장합니다.
//두번째 : membersArray의 JSONArray 객체를 생성한 후
//     회원 정보를 저장한 JSON 객체를 차례대로 저장 처리 합니다.
//세번째 : membersArray 배열에 회원 정보를 저장한 후
//     totalObject로 JSONObject 객체를 생성하여
//     name에는 자바스크립트에서 접근할 때 사용하는 이름인
//     members를, value에는 membersArray를 최종적으로 저장 처리합니다.

@WebServlet("/json2")
public class JsonServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandler(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandler(request, response);
	}

	private void doHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		
		// 배열을 저장할 totalObject를 정의합니다.
		JSONObject totalObject = new JSONObject();
		// memberInfo JSON 객체를 저장할 memberArray 배열을 정의합니다.
		JSONArray membersArray = new JSONArray();
		
		//회원 한 명의 정보가 들어갈 memberInfo JSON 객체를 정의합니다
		JSONObject memberInfo = new JSONObject();
		
		// 회원정보를 name/value 쌍으로 저장처리합니다.
		memberInfo.put("name", "장나라");
		memberInfo.put("age", "25");
		memberInfo.put("gender", "여성");
		memberInfo.put("nickname", "가수");
		
		// 회원 정보를 다시 membersArray 배열에 저장(추가) 합니다.
		membersArray.add(memberInfo);
		
		//다른 회원 정보를 name/value 쌍으로 저장한 후 membersArray에 다시 저장 처리 합니다.
		memberInfo = new JSONObject();
		memberInfo.put("name", "김연아");
		memberInfo.put("age", "21");
		memberInfo.put("gender", "여성");
		memberInfo.put("nickname", "피겨스케이트선수");
		membersArray.add(memberInfo);
		
		// totalObject에 members라는 name으로 membersArray를 value로 저장 처리합니다.
		totalObject.put("members", membersArray);
		
		//JSONObject를 문자열로 변환 처리 합니다.
		String jsonInfo = totalObject.toJSONString();
		System.out.println("★★★" + jsonInfo); // 서버 콘솔에 정보를 표시합니다.
		
		// JSON 데이터를 브라우저로 전송합니다.
		writer.print(jsonInfo);
	}
}

