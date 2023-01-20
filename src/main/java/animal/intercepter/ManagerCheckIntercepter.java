package animal.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import animal.vo.LoginUserInfo;

public class ManagerCheckIntercepter implements HandlerInterceptor {
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	throws Exception{
		//컨트롤러가 수행되기전 실행되는 메서드 : 매니저 권한 확인
		HttpSession session = request.getSession();
		
		if(session != null) {
			Object obj = session.getAttribute("userInfo");
			if(obj !=null) {//로그인된 계정이 존재한다면 => 패스
				LoginUserInfo userInfo = (LoginUserInfo) session.getAttribute("userInfo");
				if(userInfo.getAdmin()==1) {
					return true;
				}else {
					response.sendRedirect(request.getContextPath()+"/main");
				}
			}
		}
		response.sendRedirect(request.getContextPath()+"/login");
		return false;
	}
}
