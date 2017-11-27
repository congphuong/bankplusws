package com.bankplus.model;

public class Employees {
    private int idEmployee;
    private int idStore;
    private String employeeName, storeName;
    private String gender, address;

    public Employees(int idEmployee, int idStore, String employeeName, String storeName, String gender, String address) {
        this.idEmployee = idEmployee;
        this.idStore = idStore;
        this.employeeName = employeeName;
        this.storeName = storeName;
        this.gender = gender;
        this.address = address;
    }

    public Employees() {
    }

    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
    }

    public int getIdStore() {
        return idStore;
    }

    public void setIdStore(int idStore) {
        this.idStore = idStore;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
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
        return "Employees{" +
                "idEmployee=" + idEmployee +
                ", idStore=" + idStore +
                ", employeeName='" + employeeName + '\'' +
                ", storeName='" + storeName + '\'' +
                ", gender='" + gender + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
