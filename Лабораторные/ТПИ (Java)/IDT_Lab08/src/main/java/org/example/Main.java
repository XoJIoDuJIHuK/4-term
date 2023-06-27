package org.example;
import java.net.*;
import java.io.*;
public class Main {
    public static void main(String[] args) throws Exception {
        URL oracle = new URL("https://www.wikipedia.org//");
        BufferedReader in = new BufferedReader(
                new InputStreamReader(oracle.openStream()));

        String inputLine;
        while ((inputLine = in.readLine()) != null)
            System.out.println(inputLine);
        in.close();
    }
}
