package com.xtg;

public class RegisterService {

    private RegisterDao registerDao =
            new RegisterDao();

    public UserBean registerUser(
            UserBean userBean) {

        return registerDao.registerUser(
                userBean);
    }
}