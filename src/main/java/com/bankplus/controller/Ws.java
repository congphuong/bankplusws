package com.bankplus.controller;

import com.bankplus.DAO.CustomerDAO;
import com.bankplus.model.WalletHistory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class Ws {
    CustomerDAO cd=new CustomerDAO();
    @RequestMapping(value = "/lichsu/{id}",method = RequestMethod.GET)
    public ArrayList<WalletHistory> lichSu(@PathVariable int id){
        return cd.walletHistory(id);
    }

}
