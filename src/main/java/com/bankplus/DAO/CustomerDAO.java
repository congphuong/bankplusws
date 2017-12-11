package com.bankplus.DAO;

import com.bankplus.connection.MyPool;
import com.bankplus.model.Customer;
import com.bankplus.model.User;
import com.bankplus.model.WalletHistory;
import org.apache.commons.pool.ObjectPool;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.sql.*;
import java.util.ArrayList;

public class CustomerDAO {
    private static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

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

    public ArrayList<WalletHistory> walletHistory(int idCustomer) {
        WalletHistory walletHistory = null;
        ArrayList<WalletHistory> list = new ArrayList<>();
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();

        try {
            connection = (Connection) pool.borrowObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("select * from V_HISTORY where V_HISTORY.USER_ID = ? and ROWNUM <= 5 order by V_HISTORY.USER_ID desc;");
            ps.setInt(1, idCustomer);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                walletHistory = new WalletHistory();
                walletHistory.setWalletHistoryID(rs.getInt(1));
                walletHistory.setIdCustomer(rs.getInt(2));
                walletHistory.setChangeType(rs.getInt(3));
                walletHistory.setChangeCost(rs.getDouble(4));
                walletHistory.setChangeDate(rs.getTimestamp(5));
                walletHistory.setNameCustomer(rs.getString(6));
                list.add(walletHistory);
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


    public boolean register(Customer customer) {
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();
        String result = "";
        String sql = "{? = call register(?,?,?,?,?,?,?)}";
        CallableStatement ps = null;
        try {
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareCall(sql);
            ps.registerOutParameter(1, Types.VARCHAR);
            ps.setString(2, customer.getUserName());
            ps.setString(3, bCryptPasswordEncoder.encode(customer.getPassword()));
            ps.setString(4, customer.getIndentify());
            ps.setString(5, customer.getFirstName());
            ps.setString(6, customer.getLastName());
            ps.setString(7, customer.getGender());
            ps.setString(8, customer.getAddress());

            ps.execute();

            return "done".equalsIgnoreCase(ps.getString(1));
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

    public boolean login(String username, String password) {
        String sql = "{? = call login(?)}";
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();
        CallableStatement ps = null;

        try {
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareCall(sql);
            ps.registerOutParameter(1, Types.VARCHAR);
            ps.setString(2, username);
//            ps.setString(3, bCryptPasswordEncoder.encode(password));

            ps.execute();
            return bCryptPasswordEncoder.matches(password, ps.getString(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = new Customer("congphuong123", "congphuong123", "Phuong", "Cong", "213123123", "Nam", "Quang Nam");

//       System.out.println(customerDAO.walletHistory(1));

//        System.out.println(bCryptPasswordEncoder.encode("trile28"));
//        System.out.println(bCryptPasswordEncoder.matches("trile28", "$2a$10$p7g5HFjV0RGDDSxffYZneuC3uTkNsPkam5RdrECwej02iQ2jUYznq"));
//        System.out.println(customerDAO.login("trile28", "trile28"));
        System.out.println(customerDAO.register(customer));
    }
}
