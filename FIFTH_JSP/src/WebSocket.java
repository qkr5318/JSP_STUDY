import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

// WebSocket의 호스트 주소 설정
@ServerEndpoint("/websocket")
public class WebSocket {
	
	// WebSocket으로 브라우저가 접속하면 요청되는 함수 정의
	@OnOpen
	public void handleOpen() {
		// 콘솔에 접속 로그를 출력합니다.
		System.out.println("client is now connected...");
	}
	
	//WebSocket으로 메시지가 오면 요청되는 함수 정의
	@OnMessage
	public String handleMessage(String message) {
		// 메시지 내용을 콘솔에 출력합니다.
		System.out.println("receive from client : " + message);
		// 에코 메세지를 작성합니다.
		String replymessage = "ech " + message;
		// 에코 메시지를 콘솔에 출력합니다.
		System.out.println("send to client : " + replymessage);
		// 에코 메세지를 브라우저에 보내줍니다.
		return replymessage;
	}
	// WebSocket과 브라우저가 접속이 끊기면 요처되는 함수 정의
	@OnClose
	public void handleClose() {
		// 콘솔에 접속 끊김 로그를 출력합니다.
		System.out.println("client is now disconnected...");
	}
	// WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수 정의
	@OnError
	public void handleError(Throwable t) {
		// 콘솔에 에러를 표시합니다. 
		t.printStackTrace();
	}
	

}
