package animal.socket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import animal.dao.MessageMapper;

public class EchoHandler extends TextWebSocketHandler {

	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private MessageMapper messageMapper;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String userName = searchUserName(session);
		
		sessionList.add(session);
		
		session.sendMessage(new TextMessage("recMs :"+messageMapper.countMessageView(userName)));
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String userName = searchUserName(session);
		for(WebSocketSession sess:sessionList) {
			sess.sendMessage(new TextMessage(userName+":"+message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String userName = searchUserName(session);
		System.out.println("연결 끊어짐");
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(userName+"님의 연결이 끊어졌습니다."));
		}
		sessionList.remove(session);
	}
	
	
	public String searchUserName(WebSocketSession session) {
		String userName;
		Map<String,Object> map;
		map = session.getAttributes();
		userName = (String) map.get("userName");
		return userName;
	}
	
	
	
	
}
