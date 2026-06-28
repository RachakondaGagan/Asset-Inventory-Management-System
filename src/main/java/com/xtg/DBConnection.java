package com.xtg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.log4j.Logger;

public class DBConnection {

    private static final Logger logger =
            Logger.getLogger(DBConnection.class);

    private static final String DRIVER =
            "oracle.jdbc.driver.OracleDriver";

    private static final String DB_URL =
            "jdbc:oracle:thin:@//localhost:1521/XE";

    private static final String DB_USER =
            "xtg_user";

    private static final String DB_PASSWORD =
            "password123";

    public static Connection getConnection()
            throws SQLException {

        try {
            Class.forName(DRIVER);

            Connection conn =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD);

            logger.info(
                    "Database connection established.");

            return conn;
        }
        catch (ClassNotFoundException e) {
            logger.error(
                    "Oracle JDBC Driver not found.", e);

            throw new SQLException(
                    "Oracle Driver not found.", e);
        }
    }

    public static void closeConnection(
            Connection conn) {

        if (conn != null) {
            try {
                conn.close();
                logger.info(
                        "Database connection closed.");
            }
            catch (SQLException e) {
                logger.error(
                        "Error closing connection.", e);
            }
        }
    }
}