package com.bankplus.model;

public class QRCode {
    private int userTo;
    private double exchangeMoney;
    private String note;

    public QRCode() {
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    @Override
    public String toString() {
        return "QRCode{" +
                "userTo=" + userTo +
                ", exchangeMoney=" + exchangeMoney +
                ", note='" + note + '\'' +
                '}';
    }
}
