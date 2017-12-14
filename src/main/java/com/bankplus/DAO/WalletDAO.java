package com.bankplus.DAO;

import com.bankplus.connection.MyPool;
import com.bankplus.model.Customer;
import com.bankplus.model.Exchange;
import com.bankplus.model.RequestQR;
import io.jsonwebtoken.impl.crypto.MacProvider;
import org.apache.commons.pool.ObjectPool;
import org.json.simple.JSONObject;
import org.omg.CORBA.Request;

import java.security.Key;
import java.sql.*;

public class WalletDAO {
    AESEncryptor AESEncryptor = new AESEncryptor();

    public boolean exchange(Exchange exchange) {
        String sql = "{? = call exchange(?, ?, ?, ?, ?)}";
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();
        CallableStatement ps = null;

        try {
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareCall(sql);
            ps.registerOutParameter(1, Types.INTEGER);
            ps.setInt(2, exchange.getIdEmployee());
            ps.setInt(3, exchange.getUserFrom());
            ps.setDouble(4, exchange.getExchangeMoney());
            ps.setInt(5, exchange.getExchangeType());
            ps.setString(6, exchange.getExchangeNote());

            ps.execute();
            return 1 == ps.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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
    }

    public boolean transfer(Exchange exchange) {
        String sql = "{? = call transfer(?, ?, ?, ?, ?)}";
        Connection connection = null;
        ObjectPool pool = MyPool.getInstance();
        CallableStatement ps = null;

        try {
            connection = (Connection) pool.borrowObject();
            ps = connection.prepareCall(sql);
            ps.registerOutParameter(1, Types.INTEGER);
            ps.setInt(2, exchange.getUserFrom());
            ps.setInt(3, exchange.getUserTo());
            ps.setDouble(4, exchange.getExchangeMoney());
            ps.setInt(5, exchange.getExchangeType());
            ps.setString(6, exchange.getExchangeNote());

            ps.execute();
            return 1 == ps.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
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
    }


    public static void main(String[] args) throws Exception {
        WalletDAO walletDAO = new WalletDAO();
//        System.out.println(walletDAO.exchange(1, 1, 200000.0, 2, "Nop tien"));
//        System.out.println(walletDAO.transfer(1, 3, 500000, 3, "Chuyen khoan"));
        Customer customer = new Customer(23, "congphuong123", "congphuong123", "Phuong", "Cong Cong", "213123123", "Nam", "Quang Nam");

        Key key = MacProvider.generateKey();


        JSONObject json = new JSONObject();
        json.put("Ten", "Tri le");
        json.put("Lop", "DH14DTB");
        json.put("Truong", "DHNL");

        String code = walletDAO.encodeQR(json.toString());
        System.out.println(code);
        System.out.println(walletDAO.decodeQR(code));
    }

    public String encodeQR(String jsonObject) throws Exception {
        String encrypto = AESEncryptor.encrypt(jsonObject);

        return encrypto;
    }

    public String decodeQR(String code) throws Exception {
        String decode = AESEncryptor.decrypt(code);
        return decode;
    }
}
