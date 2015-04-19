package com.bookonline.Filter;
import javax.servlet.*;
import java.io.IOException;
import java.util.logging.Filter;
import java.util.logging.LogRecord;


public class SetCharacterEncoding implements Filter {
	private static  String  Encoding ;
	public void destroy() {
		// TODO Auto-generated method stub
		//System.out.println("---------exit  filter");
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		arg0.setCharacterEncoding(Encoding);
		//System.out.println("----------"+Encoding);
        arg2.doFilter(arg0, arg1);
	}

	public void init(FilterConfig arg0) throws ServletException {
		Encoding = arg0.getInitParameter("encoding");
		//System.out.println("***************init filter");

	}

	@Override
	public boolean isLoggable(LogRecord record) {
		return false;
	}
}
