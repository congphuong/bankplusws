package com.bankplus.DAO;

import com.bankplus.connection.MyPool;
import com.bankplus.model.Customer;
import com.bankplus.model.CustomerDetail;
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
            while (rs.next()) {
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

    public int maxID(int idCustomer) {
        String sql = "select max(WALLET_HISTORY_ID) from v_history where v_history.USER_ID = " + idCustomer;
        int result = 0;
        Connection connection = null;
        PreparedStatement ps = null;
        ObjectPool pool = MyPool.getInstance();

        try {
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareStatement(sql);
//            ps.setInt(1, idCustomer);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (connection != null)
                    pool.returnObject(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public int minID(int idCustomer) {
        String sql = "select min(WALLET_HISTORY_ID) from v_history where v_history.USER_ID = " + idCustomer;
        int result = 0;
        Connection connection = null;
        PreparedStatement ps = null;
        ObjectPool pool = MyPool.getInstance();

        try {
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareStatement(sql);
//            ps.setInt(1, idCustomer);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null)
                    ps.close();
                if (connection != null)
                    pool.returnObject(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public ArrayList<WalletHistory> walletHistory(int idCustomer, int numpages, int offset) {
        WalletHistory walletHistory;
        String sql = "select * from V_HISTORY where V_HISTORY.USER_ID = ? and WALLET_HISTORY_ID < ? AND ROWNUM <= ?";
        int maxid = maxID(idCustomer);
        int minid = minID(idCustomer);
        if (offset > maxid || offset <= 0) {
            offset = maxid + 1;
        } else if (offset <= minid) {
            offset = minid;
        }
        ArrayList<WalletHistory> list = new ArrayList<>();
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();

        try {
            connection = (Connection) pool.borrowObject();

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idCustomer);
            ps.setInt(2, offset);
            ps.setInt(3, numpages);

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
            ps.setString(4, customer.getIdentify());
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
        Customer customer = new Customer(23, "congphuong123", "congphuong123", "Phuong", "Cong Cong", "213123123", "Nam", "Quang Nam");

//        System.out.println(customerDAO.walletHistory(1, 5).size());
//        System.out.println(customerDAO.size(1));
//        System.out.println(bCryptPasswordEncoder.encode("trile28"));
//        System.out.println(bCryptPasswordEncoder.matches("trile28", "$2a$10$p7g5HFjV0RGDDSxffYZneuC3uTkNsPkam5RdrECwej02iQ2jUYznq"));
//        System.out.println(customerDAO.login("trile28", "trile28"));
//        System.out.println(customerDAO.register(customer));
        System.out.println(customerDAO.changeInfo(customer));
    }

    public boolean changeInfo(Customer customer) {
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();
        String result = "";
        String sql = "{? = call changeInfo(?,?,?,?,?,?)}";

        CallableStatement ps = null;
        try {
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareCall(sql);
            ps.registerOutParameter(1, Types.INTEGER);

            ps.setInt(2, customer.getIdCustomer());
            ps.setString(3, customer.getIdentify());
            ps.setString(4, customer.getFirstName());
            ps.setString(5, customer.getLastName());
            ps.setString(6, customer.getGender());
            ps.setString(7, customer.getAddress());

            ps.execute();

            return 1 == ps.getInt(1);
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

    public CustomerDetail getCustDetail(int id) {
        CustomerDetail customerDetail = null;
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();
        PreparedStatement ps = null;
        ResultSet rs;
        String sql = "select * from v_detail where user_id = ?";

        try {
            customerDetail = new CustomerDetail();
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            while (rs.next()) {
                customerDetail.setIdCustomer(rs.getInt(1));
                customerDetail.setNameCustomer(rs.getString(3));
                customerDetail.setTotalMoney(rs.getDouble(4));
            }
            rs.close();
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
        return customerDetail;
    }

}
