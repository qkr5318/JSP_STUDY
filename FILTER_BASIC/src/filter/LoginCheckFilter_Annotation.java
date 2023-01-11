package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

// 간단하게 session에 "MEMBER" 속성이 존재하면 로그인한 것으로 판단하는 
// 필터인 LoginCheckFilter 클래스를 코딩해 봅니다.

//간단하게 session에 "MEMBER" 속성이 존재하면 로그인한 것으로 판단하는
//필터인 LoginCheckFilter 클래스를 코딩해 봅니다.
//@WebFilter 애노테이션을 활용해서 필터 적용도 가능합니다.
//즉,web.xml 파일에 필터를 지정하지 않더라도
//Filter 인터페이스가 @WebFilter 애노테이션을 가지면 자동으로 필터로 등록 처리 됩니다.

// boardAnno 폴더안에 있는 모든 페이지 적용 /*
@WebFilter("/boardAnno/*")
//@WebFilter("/boardAnno/baordListAnno.jsp") boardAnno 폴더안에 페이지 하나만 적용한거
public class LoginCheckFilter_Annotation implements Filter {
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession	session = httpRequest.getSession(false);
		
		boolean login = false;
		if(session != null) {
			if(session.getAttribute("MEMBER")!=null&&session.getAttribute("MEMBER")!="") {
				login = true;
			}
		}
		if (login) {
			// 로그인 검사 필터는 로그인한 상태라면
			// 필터 체인의 다음 필터로 이동하고,
			chain.doFilter(request, response);
		} else {
			// 로그인한지 않은 상태로 판단되면
			// 로그인 페이지로 이동 처리합니다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFormAnno.jsp");
			dispatcher.forward(request, response);
			//RequestDispatcher 서블릿 forward(request, response)
			// forward() : 페이지 출력, 페이지 전환
			// sedRedirect() : 특정 url로 재 요청
		}
	}
	
	
	
	@Override// 종결시켜주는거
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}

	@Override // 초기화 시켜주는거
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		Filter.super.init(filterConfig);
	}

       
   
}
