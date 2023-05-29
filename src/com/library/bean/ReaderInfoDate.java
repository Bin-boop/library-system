package com.library.bean;


public class ReaderInfoDate extends ReaderInfo {
    String birthday;

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "ReaderInfoDate{" +
                "birthday='" + birthday + '\'' +
                "} " + super.toString();
    }
}
