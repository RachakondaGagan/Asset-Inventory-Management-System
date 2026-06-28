package com.xtg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;

public class RegisterController
        extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final Logger logger =
            Logger.getLogger(
                    RegisterController.class);

    private RegisterManagerImpl
            registerManager =
            new RegisterManagerImpl();

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        request.setCharacterEncoding(
                "UTF-8");

        response.setContentType(
                "application/json");

        response.setCharacterEncoding(
                "UTF-8");

        UserBean userBean =
                new UserBean();

        userBean.setFullName(
                request.getParameter(
                        "fullName"));

        userBean.setUserName(
                request.getParameter(
                        "userName"));

        userBean.setEmail(
                request.getParameter(
                        "email"));

        userBean.setPassword(
                request.getParameter(
                        "password"));

        userBean.setGender(
                request.getParameter(
                        "gender"));

        logger.info(
                "Registration request received for : "
                        + userBean.getUserName());

        UserBean result =
                registerManager
                        .processRegistration(
                                userBean);

        Gson gson = new Gson();

        PrintWriter out =
                response.getWriter();

        out.print(
                gson.toJson(result));

        out.flush();
        out.close();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        response.sendRedirect(
                "Register.jsp");
    }
}