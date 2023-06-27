package com.example.multithreading;

public class Main {
    public static void main(String[] args) {
        Thread thread = new Thread(new MyRunnable());
        thread.start();
    }
}

class MyRunnable implements Runnable {
    private final Object mutex = new Object();
    private int count = 0;

    public void run() {
        synchronized (mutex) {
            count++;
        }
    }
}