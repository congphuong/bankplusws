package com.bankplus.controller;

import com.bankplus.DAO.CustomerDAO;
import com.bankplus.DAO.WalletDAO;
import com.bankplus.model.Customer;
import com.bankplus.model.Exchange;
import com.bankplus.model.WalletHistory;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(value = "/customer/history/{id}", method = RequestMethod.GET)
    public ArrayList<WalletHistory> walletHistories(@PathVariable int id) {
        return customerDAO.walletHistory(id);
    }

    @RequestMapping(value = "/customer/exchange", method = RequestMethod.POST)
    public MessageResult exchange(@RequestBody Exchange exchange) {
        boolean tmp = walletDAO.exchange(exchange);
        if (tmp) {
            return new MessageResult(true, "Exchange Success!");
        } else {
            return new MessageResult(false, "Exchange Failed!");
        }
    }

    @RequestMapping(value = "/customer/transfer", method = RequestMethod.POST)
    public MessageResult transfer(@RequestBody Exchange exchange) {
        boolean tmp = walletDAO.transfer(exchange);
        if (tmp) {
            return new MessageResult(true, "Transfer Success!");
        } else {
            return new MessageResult(false, "Transfer Failed!");
        }
    }

}
