package com.bankplus.model;

public class Store {
    private int idStore;
    private String nameStore, address;

    public Store(int idStore, String nameStore, String address) {
        this.idStore = idStore;
        this.nameStore = nameStore;
        this.address = address;
    }

    public Store() {
    }

    public int getIdStore() {
        return idStore;
    }

    public void setIdStore(int idStore) {
        this.idStore = idStore;
    }

    public String getNameStore() {
        return nameStore;
    }

    public void setNameStore(String nameStore) {
        this.nameStore = nameStore;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Store{" +
                "idStore=" + idStore +
                ", nameStore='" + nameStore + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
