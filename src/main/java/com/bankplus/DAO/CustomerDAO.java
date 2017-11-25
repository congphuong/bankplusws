package com.bankplus.DAO;

import com.bankplus.connection.MyPool;
import com.bankplus.model.User;
import org.apache.commons.pool.ObjectPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO {

    public User getUserByUsername(String username) {
        User user = null;
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();

        try {
            connection = (Connection) pool.borrowObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("Select * from customer where username=?");
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (connection != null)
                    pool.returnObject(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();
        System.out.println(customerDAO.getUserByUsername("trile"));
    }
}
