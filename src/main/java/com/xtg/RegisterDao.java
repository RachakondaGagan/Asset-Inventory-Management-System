package com.xtg;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import org.apache.log4j.Logger;

public class RegisterDao {

    private static final Logger logger =
            Logger.getLogger(RegisterDao.class);

    public UserBean registerUser(UserBean userBean) {

        Connection conn = null;
        CallableStatement cstmt = null;

        try {

            conn = DBConnection.getConnection();

            cstmt = conn.prepareCall(
                    "{CALL XT_USER_REGISTER_PRC(?,?,?,?,?,?,?)}");

            cstmt.setString(
                    1,
                    userBean.getFullName());

            cstmt.setString(
                    2,
                    userBean.getUserName());

            cstmt.setString(
                    3,
                    userBean.getEmail());

            cstmt.setString(
                    4,
                    userBean.getPassword());

            cstmt.setString(
                    5,
                    userBean.getGender());

            cstmt.registerOutParameter(
                    6,
                    Types.VARCHAR);

            cstmt.registerOutParameter(
                    7,
                    Types.VARCHAR);

            cstmt.execute();

            userBean.setStatus(
                    cstmt.getString(6));

            userBean.setMessage(
                    cstmt.getString(7));

            logger.info(
                    "Registration Status : "
                            + userBean.getStatus());

        }
        catch (SQLException e) {

            logger.error(
                    "RegisterDao Error",
                    e);

            userBean.setStatus(
                    "FAIL");

            userBean.setMessage(
                    "Registration failed.");
        }
        finally {

            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            }
            catch (SQLException e) {
                logger.error(e);
            }

            DBConnection.closeConnection(conn);
        }

        return userBean;
    }
}