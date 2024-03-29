package com.bankplus.model;

public class CustomerDetail {
    private int idCustomer;
    private String nameCustomer;
    private double totalMoney;

    public CustomerDetail(int idCustomer, String nameCustomer, double totalMoney) {
        this.idCustomer = idCustomer;
        this.nameCustomer = nameCustomer;
        this.totalMoney = totalMoney;
    }

    public CustomerDetail() {
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    @Override
    public String toString() {
        return "CustomerDetail{" +
                "idCustomer=" + idCustomer +
                ", nameCustomer='" + nameCustomer + '\'' +
                ", totalMoney=" + totalMoney +
                '}';
    }
}
