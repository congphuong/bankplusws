package com.bankplus.controller;

import com.bankplus.DAO.CustomerDAO;
import com.bankplus.DAO.WalletDAO;
import com.bankplus.model.*;
import com.bankplus.security.JwtGetUserDetail;
import io.jsonwebtoken.impl.crypto.MacProvider;
import jdk.nashorn.internal.parser.JSONParser;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.security.Key;
import java.util.ArrayList;

@RestController
public class EWalletWebService {
    CustomerDAO customerDAO = new CustomerDAO();
    WalletDAO walletDAO = new WalletDAO();

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public MessageResult register(@RequestBody Customer customer) {
        if (customer.getUserName() == "" || customer.getPassword() == "") {
            return new MessageResult(false, "No username or password!");
        }
        boolean result = customerDAO.register(customer);
        if (result) {
            return new MessageResult(true, "Register successfully!");
        } else {
            return new MessageResult(false, "Register failure! Duplicate username!");
        }
    }

    @RequestMapping(value = "/customer/history/{numpages}/{offset}", method = RequestMethod.GET)
    public ArrayList<WalletHistory> walletHistories(@PathVariable int numpages, @PathVariable int offset) {
        return customerDAO.walletHistory(JwtGetUserDetail.getCurrentUserDetail().getId(), numpages, offset);

    }

    @RequestMapping(value = "/customer/detail", method = RequestMethod.GET)
    public CustomerDetail getCustDetail() {
        return customerDAO.getCustDetail(JwtGetUserDetail.getCurrentUserDetail().getId());
    }

    @RequestMapping(value = "/customer/changeInfo", method = RequestMethod.PUT)
    public MessageResult changeInfo(@RequestBody Customer customer) {
        boolean tmp = customerDAO.changeInfo(customer);
        if (tmp) {
            return new MessageResult(true, "Change information succeed!");
        } else {
            return new MessageResult(false, "Change information failed!");
        }
    }

    @RequestMapping(value = "/customer/exchange", method = RequestMethod.POST)
    public MessageResult exchange(@RequestBody Exchange exchange) {
//        exchange.se
        if (exchange.getExchangeType() == 3 && exchange.getUserFrom() == JwtGetUserDetail.getCurrentUserDetail().getId()) {
            boolean tmp = walletDAO.exchange(exchange);
            if (tmp) {
                return new MessageResult(true, "Exchange Success!");
            } else {
                return new MessageResult(false, "Exchange Failed!");
            }
        }
        return new MessageResult(false, "Exchange Failed!");
    }

    @RequestMapping(value = "/customer/transfer", method = RequestMethod.POST)
    public MessageResult transfer(@RequestBody Exchange exchange) {
        if (exchange.getExchangeType() == 3 && exchange.getUserFrom() == JwtGetUserDetail.getCurrentUserDetail().getId()) {
            boolean tmp = walletDAO.transfer(exchange);
            if (tmp) {
                return new MessageResult(true, "Transfer Success!");
            } else {
                return new MessageResult(false, "Transfer Failed!");
            }
        }
        return new MessageResult(false, "Exchange Failed!");
    }

    @RequestMapping(value = "/customer/transferqr", method = RequestMethod.POST)
    public MessageResult transferqr(@RequestBody RequestQR code) throws Exception {
        String result = walletDAO.decodeQR(code.getCode());
        JSONObject jsonObject = new JSONObject();
        try {
            org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();
            jsonObject = (JSONObject) parser.parse(result);
            String idst = jsonObject.get("userTo") + "";
            Exchange exc = new Exchange();
            exc.setUserTo(Integer.parseInt(idst));
            exc.setUserFrom(JwtGetUserDetail.getCurrentUserDetail().getId());
            exc.setExchangeMoney(Double.parseDouble(jsonObject.get("exchangeMoney") + ""));
            exc.setExchangeNote(jsonObject.get("note") + "");
            exc.setExchangeType(3);
            boolean tmp = walletDAO.transfer(exc);
            if (tmp) {
                return new MessageResult(true, "Transfer Success!");
            } else {
                return new MessageResult(false, "Transfer Failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new MessageResult(false, "Exchange Failed!");
    }

    @RequestMapping(value = "customer/encodeQRImage", method = RequestMethod.POST)
    public RequestQR encodeQR(@RequestBody QRCode qrCode) throws Exception {
        RequestQR requestQR = new RequestQR();
        JSONObject object = new JSONObject();
        if (qrCode.getExchangeMoney() != 0) {
            object.put("userTo", JwtGetUserDetail.getCurrentUserDetail().getId());
            object.put("exchangeMoney", qrCode.getExchangeMoney());
            object.put("note", qrCode.getNote());
            requestQR.setCode(walletDAO.encodeQR(object.toString()));
            return requestQR;
        }
        return requestQR;
    }

    @RequestMapping(value = "customer/decodeQRImage", method = RequestMethod.POST)
    public JSONObject decodeQR(@RequestBody RequestQR code) throws Exception {
        String result = walletDAO.decodeQR(code.getCode());
        JSONObject jsonObject = new JSONObject();
        try {
            org.json.simple.parser.JSONParser parser = new org.json.simple.parser.JSONParser();
            jsonObject = (JSONObject) parser.parse(result);
            String id = jsonObject.get("userTo") + "";
            CustomerDAO cd = new CustomerDAO();
            String username = cd.getCustDetail(Integer.parseInt(id)).getNameCustomer();
            jsonObject.put("username",username);

            return jsonObject;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
}
