/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author DesktopAMD
 */
package filters;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter(urlPatterns = {"/AdminServlet", "/EditServlet", "/DeleteServlet"})
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AuthFilter Inicializado");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Obtener la sesión sin crear una nueva si no existe
        HttpSession session = req.getSession(false);
        boolean loggedIn = (session != null && session.getAttribute("username") != null);

        if (!loggedIn) {
            System.out.println("Usuario no autenticado - Redirigiendo a login.jsp");
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            System.out.println("Usuario autenticado como: " + session.getAttribute("username"));
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        System.out.println("AuthFilter Destruido");
    }
}

