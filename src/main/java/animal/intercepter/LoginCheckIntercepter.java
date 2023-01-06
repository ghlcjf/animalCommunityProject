package animal.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginCheckIntercepter implements HandlerInterceptor{

	//인터셉터를 적용하기 위해서 알아야될 내용: .xml ->mvc:animal-mvc.xml
	//어떤 컨트롤러에 적용할지
	//어떤 인터셉터를 적용할지
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	throws Exception{
		//컨트롤러가 수행되기전 실행되는 메서드 : 로그인 인증
		HttpSession session = request.getSession();
		
		if(session != null) {
			Object obj = session.getAttribute("loginInfo");
			if(obj !=null) {
				return true; //로그인된 계정이 존재한다면 => 패스
			}
		}
		response.sendRedirect(request.getContextPath()+"login");
		return false;
	}

	
	
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 컨트롤러가 수행된 후 / 뷰페이지 작동되기 전 구동되는 메서드
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// 뷰페이지까지 보여주고 난 후에 구동되는 메서드
	}	
	
	
	
	
}




