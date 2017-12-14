package com.bankplus.connection;

import org.apache.commons.pool.BasePoolableObjectFactory;

import java.sql.DriverManager;

public class ConnectionPool extends BasePoolableObjectFactory {
    private String host;
    private int port;
    private String schema;
    private String user;
    private String password;

    public ConnectionPool(String host, int port,
                                      String user, String password) {
        this.host = host;
        this.port = port;
        this.user = user;
        this.password = password;
    }

    @Override
    public Object makeObject() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        //String url = "jdbc:oracle:thin:@" + host + ":" + port + ":DB11G";
        String url = "jdbc:oracle:thin:@//localhost:1521/orclpdb1.localdomain";
        return DriverManager.getConnection(url, user, password);
    }
}