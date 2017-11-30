package com.bankplus.model;

public class Customer {
    private int idCustomer;
    private String userName;
    private String password;
    private String firstName, lastName;
    private String indentify, gender, address;

    public Customer(int idCustomer, String userName, String password, String firstName, String lastName, String indentify, String gender, String address) {
        this.idCustomer = idCustomer;
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.indentify = indentify;
        this.gender = gender;
        this.address = address;
    }
    public Customer(String userName, String password, String firstName, String lastName, String indentify, String gender, String address) {
        this.userName = userName;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.indentify = indentify;
        this.gender = gender;
        this.address = address;
    }

    public Customer() {
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getIndentify() {
        return indentify;
    }

    public void setIndentify(String indentify) {
        this.indentify = indentify;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "idCustomer=" + idCustomer +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", indentify='" + indentify + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
