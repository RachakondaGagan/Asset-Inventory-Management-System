package com.xtg;

public class RegisterManagerImpl {

    private RegisterService registerService =
            new RegisterService();

    public UserBean processRegistration(
            UserBean userBean) {

        String pwdPattern =
                "^(?=.*[0-9])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,}$";

        if (!userBean.getPassword()
                .matches(pwdPattern)) {

            userBean.setStatus(
                    "FAIL");

            userBean.setMessage(
                    "Password must be at least 8 characters and contain one number and one special character.");

            return userBean;
        }

        return registerService.registerUser(
                userBean);
    }
}