package com.bankplus.security.service;

import com.bankplus.DAO.CustomerDAO;
import com.bankplus.model.User;
import com.bankplus.security.JwtUserFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by stephan on 20.03.16.
 */
@Service
public class JwtUserDetailsServiceImpl implements UserDetailsService {


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomerDAO accountDAO = new CustomerDAO();
        User user = accountDAO.getUserByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException(String.format("No user found with username '%s'.", username));
        } else {
            return JwtUserFactory.create(user);
        }
    }


}
