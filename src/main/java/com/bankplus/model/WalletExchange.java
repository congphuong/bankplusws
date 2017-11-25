package com.bankplus.model;

import java.sql.Timestamp;

public class WalletExchange {
    private int walletExchangeID;
    private int userFrom, userTo, employeeID;
    private int exchangeType;
    private double exchangeCost;
    private String exchangeNote;
    private Timestamp exchangeDate;

    public WalletExchange(int walletExchangeID, int userFrom, int userTo, int employeeID, int exchangeType, double exchangeCost, String exchangeNote, Timestamp exchangeDate) {
        this.walletExchangeID = walletExchangeID;
        this.userFrom = userFrom;
        this.userTo = userTo;
        this.employeeID = employeeID;
        this.exchangeType = exchangeType;
        this.exchangeCost = exchangeCost;
        this.exchangeNote = exchangeNote;
        this.exchangeDate = exchangeDate;
    }

    public WalletExchange() {
    }

    public int getWalletExchangeID() {
        return walletExchangeID;
    }

    public void setWalletExchangeID(int walletExchangeID) {
        this.walletExchangeID = walletExchangeID;
    }

    public int getUserFrom() {
        return userFrom;
    }

    public void setUserFrom(int userFrom) {
        this.userFrom = userFrom;
    }

    public int getUserTo() {
        return userTo;
    }

    public void setUserTo(int userTo) {
        this.userTo = userTo;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public int getExchangeType() {
        return exchangeType;
    }

    public void setExchangeType(int exchangeType) {
        this.exchangeType = exchangeType;
    }

    public double getExchangeCost() {
        return exchangeCost;
    }

    public void setExchangeCost(double exchangeCost) {
        this.exchangeCost = exchangeCost;
    }

    public String getExchangeNote() {
        return exchangeNote;
    }

    public void setExchangeNote(String exchangeNote) {
        this.exchangeNote = exchangeNote;
    }

    public Timestamp getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(Timestamp exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    @Override
    public String toString() {
        return "WalletExchange{" +
                "walletExchangeID=" + walletExchangeID +
                ", userFrom=" + userFrom +
                ", userTo=" + userTo +
                ", employeeID=" + employeeID +
                ", exchangeType=" + exchangeType +
                ", exchangeCost=" + exchangeCost +
                ", exchangeNote='" + exchangeNote + '\'' +
                ", exchangeDate=" + exchangeDate +
                '}';
    }
}
