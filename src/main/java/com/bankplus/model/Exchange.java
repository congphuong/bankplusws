package com.bankplus.model;

public class Exchange {
    private int idEmployee, userFrom, userTo;
    private double exchangeMoney;
    private int exchangeType;
    private String exchangeNote;

    public Exchange() {
    }

    public int getIdEmployee() {
        return idEmployee;
    }

    public void setIdEmployee(int idEmployee) {
        this.idEmployee = idEmployee;
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

    public double getExchangeMoney() {
        return exchangeMoney;
    }

    public void setExchangeMoney(double exchangeMoney) {
        this.exchangeMoney = exchangeMoney;
    }

    public int getExchangeType() {
        return exchangeType;
    }

    public void setExchangeType(int exchangeType) {
        this.exchangeType = exchangeType;
    }

    public String getExchangeNote() {
        return exchangeNote;
    }

    public void setExchangeNote(String exchangeNote) {
        this.exchangeNote = exchangeNote;
    }

    @Override
    public String toString() {
        return "Exchange{" +
                "idEmployee=" + idEmployee +
                ", userFrom=" + userFrom +
                ", userTo=" + userTo +
                ", exchangeMoney=" + exchangeMoney +
                ", exchangeType=" + exchangeType +
                ", exchangeNote='" + exchangeNote + '\'' +
                '}';
    }
}
