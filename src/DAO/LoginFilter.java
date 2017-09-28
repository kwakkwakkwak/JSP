package DAO;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest =(HttpServletRequest)servletRequest;
        HttpSession session = httpRequest.getSession();

        boolean login = false;
        if(session != null){
            if(session.getAttribute("id") != null){
                login = true;
            }
        }
        if(login){
            filterChain.doFilter(servletRequest,servletResponse);
        }else {

            ((HttpServletResponse)servletResponse).sendRedirect("/sign/SigninForm.jsp?target="+httpRequest.getRequestURI());
        }

    }

    @Override
    public void destroy() {

    }
}
