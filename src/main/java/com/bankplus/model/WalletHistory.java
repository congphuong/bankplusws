package com.bankplus.model;

import java.sql.Timestamp;

public class WalletHistory {
    private int walletHistoryID;
    private int idCustomer;
    private String nameCustomer;
    private int changeType;
    private double changeCost;
    private Timestamp changeDate;

    public WalletHistory() {
    }

    public WalletHistory(int walletHistoryID, int idCustomer, String nameCustomer, int changeType, double changeCost, Timestamp changeDate) {
        this.walletHistoryID = walletHistoryID;
        this.idCustomer = idCustomer;
        this.nameCustomer = nameCustomer;
        this.changeType = changeType;
        this.changeCost = changeCost;
        this.changeDate = changeDate;
    }

    public int getWalletHistoryID() {
        return walletHistoryID;
    }

    public void setWalletHistoryID(int walletHistoryID) {
        this.walletHistoryID = walletHistoryID;
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

    public int getChangeType() {
        return changeType;
    }

    public void setChangeType(int changeType) {
        this.changeType = changeType;
    }

    public double getChangeCost() {
        return changeCost;
    }

    public void setChangeCost(double changeCost) {
        this.changeCost = changeCost;
    }

    public Timestamp getChangeDate() {
        return changeDate;
    }

    public void setChangeDate(Timestamp changeDate) {
        this.changeDate = changeDate;
    }

    @Override
    public String toString() {
        return "WalletHistory{" +
                "walletHistoryID=" + walletHistoryID +
                ", idCustomer=" + idCustomer +
                ", nameCustomer='" + nameCustomer + '\'' +
                ", changeType=" + changeType +
                ", changeCost=" + changeCost +
                ", changeDate=" + changeDate +
                '}';
    }
}
