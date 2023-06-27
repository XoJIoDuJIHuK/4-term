package com.example.clientserver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Objects;
import java.util.Scanner;

public class Client {
    public static void main(String[] args) {
        try {
            // Create a Socket and connect to the server
            Socket socket = new Socket("localhost", 1234);

            // Create a BufferedReader to read data from the server
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);

            String input = "";
            Scanner scanner = new Scanner(System.in);
            while (true) {
                input = scanner.nextLine();
                if (Objects.equals(input, "exit")) break;
                out.println(input);
                System.out.println("Receiving from server:");
                // Read lines from the server until the end of transmission
                String line;
                while (!Objects.equals(line = in.readLine(), "ENDL")) {
                    System.out.println(line);
                }
            }

            // Close the socket
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}