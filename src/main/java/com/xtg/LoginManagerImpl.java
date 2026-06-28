package com.xtg;

public class LoginManagerImpl {

    private LoginService loginService = new LoginService();

    public UserBean processLogin(String userName, String password) {
        UserBean bean = new UserBean();

        if (userName == null || userName.trim().isEmpty()) {
            bean.setStatus("FAILURE");
            bean.setMessage("Username is required.");
            return bean;
        }

        if (password == null || password.trim().isEmpty()) {
            bean.setStatus("FAILURE");
            bean.setMessage("Password is required.");
            return bean;
        }

        return loginService.loginUser(
                userName.trim(),
                password);
    }
}