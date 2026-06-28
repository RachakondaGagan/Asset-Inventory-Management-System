package com.xtg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.google.gson.Gson;

public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final Logger logger =
            Logger.getLogger(LoginController.class);

    private LoginManagerImpl loginManager =
            new LoginManagerImpl();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String userName =
                request.getParameter("userName");

        String password =
                request.getParameter("password");

        logger.info(
                "Login request for : " + userName);

        UserBean result =
                loginManager.processLogin(
                        userName,
                        password);

        if ("SUCCESS".equals(
                result.getStatus())) {

            HttpSession session =
                    request.getSession(true);

            session.setAttribute(
                    "loggedInUser",
                    userName);

            session.setAttribute(
                    "fullName",
                    result.getFullName());

            session.setMaxInactiveInterval(
                    30 * 60);

            logger.info(
                    "Login successful : "
                            + userName);
        }

        PrintWriter out =
                response.getWriter();

        Gson gson = new Gson();

        out.print(
                gson.toJson(result));

        out.flush();
        out.close();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                "Login.jsp");
    }
}