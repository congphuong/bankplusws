package com.bankplus.model;

public class Wallet {
    private int idWallet;
    private int idCustomer;
    private String nameCustomer;
    private double totalMoney;

    public Wallet(int idWallet, int idCustomer, String nameCustomer, double totalMoney) {
        this.idWallet = idWallet;
        this.idCustomer = idCustomer;
        this.nameCustomer = nameCustomer;
        this.totalMoney = totalMoney;
    }

    public Wallet() {
    }

    public int getIdWallet() {
        return idWallet;
    }

    public void setIdWallet(int idWallet) {
        this.idWallet = idWallet;
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
        return "Wallet{" +
                "idWallet=" + idWallet +
                ", idCustomer=" + idCustomer +
                ", nameCustomer='" + nameCustomer + '\'' +
                ", totalMoney=" + totalMoney +
                '}';
    }
}
