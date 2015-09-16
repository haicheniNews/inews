package com.inews.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 字符编码过滤
 * @author chenzhijun
 *
 */
public class CharsetEncodeFilter implements Filter {
	private String encoding;

	public void destroy() {
		encoding = null;

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
			if (null != encoding) {
				request.setCharacterEncoding(encoding);
				response.setCharacterEncoding(encoding);
			}
			chain.doFilter(request, response);
			
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");

	}

}
