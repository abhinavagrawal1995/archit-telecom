package com.wipro.archit.telecom;

public class MyService {

    private final long id;
    private final String content;

    public MyService(long id, String content) {
        this.id = id;
        this.content = content;
    }

    public long getId() {
        return id;
    }

    public String getContent() {
        return content;
    }
}
