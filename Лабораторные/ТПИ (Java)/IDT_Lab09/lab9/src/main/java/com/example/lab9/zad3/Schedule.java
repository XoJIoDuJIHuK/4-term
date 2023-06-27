package com.example.lab9.zad3;

public class Schedule {
    private int id;
    private int user_id;
    private String channel_name;
    private String href;

    public Schedule() {}

    public Schedule(int user_id, String channel_name, String href) {
        this.user_id = user_id;
        this.channel_name = channel_name;
        this.href = href;
    }


    public int getId() {
        return id;
    }

    public int getuser_id() {
        return user_id;
    }

    public void setuser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getChannel_name() {
        return channel_name;
    }

    public void setChannel_name(String channel_name) {
        this.channel_name = channel_name;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }


}

