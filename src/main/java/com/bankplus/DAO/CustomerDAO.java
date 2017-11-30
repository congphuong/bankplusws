package com.bankplus.DAO;

import com.bankplus.connection.MyPool;
import com.bankplus.model.Customer;
import com.bankplus.model.User;
import com.bankplus.model.WalletHistory;
import org.apache.commons.pool.ObjectPool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

    public ArrayList<WalletHistory> lichSuGiaoDich(int idCustomer){
        WalletHistory wl = null;
        ArrayList<WalletHistory>list=new ArrayList<>();
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();

        try {
            connection = (Connection) pool.borrowObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("Select * from v_history where user_id=?");
            ps.setInt(1, idCustomer);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                wl = new WalletHistory();
                wl.setWalletHistoryID(rs.getInt(1));
                wl.setIdCustomer(rs.getInt(2));
                wl.setChangeType(rs.getInt(3));
                wl.setChangeCost(rs.getDouble(4));
                wl.setChangeDate(rs.getTimestamp(5));
                wl.setNameCustomer(rs.getString(6));
                list.add(wl);
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

        return list;
    }


    public boolean signOut(Customer customer){
        Customer customer1 = null;
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();
        String result = "";
        String sql ="SELECT SIGNIN(?,?,?,?,?,?,?) FROM DUAL;";
        try {
            connection = (Connection) pool.borrowObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,customer.getUserName());
            ps.setString(2, customer.getPassword());
            ps.setString(3, customer.getIndentify());
            ps.setString(4, customer.getFirstName());
            ps.setString(5, customer.getLastName());
            ps.setString(6, customer.getGender());
            ps.setString(7, customer.getAddress());

            ResultSet rs = ps.executeQuery(sql);
            while (rs.next()) {
                result = rs.getString(1);
                if(result=="done"){
                    return true;
                }
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



        return false;
    }


    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();
       System.out.println(customerDAO.signOut(new Customer("bb","cc","dd","ee","rr","male","uu")));
  //  System.out.println(customerDAO.lichSuGiaoDich(1));
        }
}
