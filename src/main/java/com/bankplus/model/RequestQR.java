package com.bankplus.model;

public class RequestQR {
    String code;

    public RequestQR(String code) {
        this.code = code;
    }

    public RequestQR() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "RequestQR{" +
                "code='" + code + '\'' +
                '}';
    }
}
