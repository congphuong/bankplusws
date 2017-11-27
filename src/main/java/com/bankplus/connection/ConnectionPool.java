package com.bankplus.connection;

import org.apache.commons.pool.BasePoolableObjectFactory;

import java.sql.DriverManager;

public class ConnectionPool extends BasePoolableObjectFactory {
    private String host;
    private int port;
    private String schema;
    private String user;
    private String password;

    public ConnectionPool(String host, int port, String schema,
                                      String user, String password) {
        this.host = host;
        this.port = port;
        this.schema = schema;
        this.user = user;
        this.password = password;
    }

    @Override
    public Object makeObject() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@" + host + ":" + port + ":"
                + schema;
        return DriverManager.getConnection(url, user, password);
    }
}