<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket 활용 index.jsp 소스 코딩</title>
</head>
<body>
    <form>
	    <!-- 송신 메시지를 작성하는 텍스트 박스 -->
	    <input id="textMessage" type="text">
	    <!-- 메시지 송신을 처리하는 버튼 -->
	    <input onclick="sendMessage()" value="Send" type="button">
	    <!-- WebSocket 접속 종료하는 버튼 -->
	    <input onclick="disconnect()" value="Disconnect" type="button">
    </form>
    <br>
    <!-- 콘솔 메시지의 역할을 하는 로그 텍스트 영역 생성(수신 메시지도 표시합니다) -->
    <textarea rows="10" cols="50" id="messageTextArea"></textarea>
    <script type="text/javascript">
    	// websocket는 호스트 명으로 지정합니다.
    	// WebSocket 객체 생성(자동으로 접속을 시작합니다. onopen 함수 호출)
    	// 본인 PC 포트를 적용합니다. (예시 : localhost:9005)
    	var webSocket = new WebSocket("ws://192.168.0.185:9005/websocket");
    	// 콘솔 텍스트 영역 객체 생성
    	var messageTextArea = document.getElementById("messageTextArea");
    	// WebSocket 서버와 접속이 되면 호출되는 함수 정의
    	webSocket.onopen = function(message) {
			// 콘솔 텍스트에 메시지를 출력 처리 합니다.
    		messageTextArea.value += "Server connect..\n";
		};
		// WebSocket 서버와 접속이 끊기면 호출되는 함수 정의
		webSocket.onclose = function(message) {
			// 콘솔 텍스트에 메시지를 출력 처리 합니다.
			messageTextArea.value += "Server Disconnect...\n";
		};
		// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수 정의
		webSocket.onerror = function(message) {
			// 콘솔 텍스트에 메시지를 출력 처리 합니다.
			messageTextArea.value += "error...\n";
		};
		// WebSocket 서버로부터 메시지가 오면 호출되는 함수 정의
		webSocket.onmessage = function(message) {
			// 콘솔 텍스트에 메시지를 출력합니다.
			messageTextArea.value += "Recieve From Server => " + message.data + "\n";
		};
		// Send 버튼을 누르면 호출되는 함수 정의
		function sendMessage() {
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득합니다.
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력 처리 합니다.
			messageTextArea.value += "Send to Server => " + message.value + "\n";
			// WebSocket 서버에 메시지를 송신 처리 합니다.
			webSocket.send(message.value);
			// 송신 메시지를 작성하는 텍스트 박스를 초기화합니다.
			message.value = "";			
		}
		// Disconnect 버튼을 누르면 호출되는 함수 정의
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}
    </script>
</body>
</html>

