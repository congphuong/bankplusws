package com.bankplus.controller;

/**
 * Created by Khuong on 2017-06-05.
 */
public class MessageResult {
    private boolean success;
    private String message;

    public MessageResult() {
    }

    public MessageResult(boolean success, String message) {
        this.success = success;
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
