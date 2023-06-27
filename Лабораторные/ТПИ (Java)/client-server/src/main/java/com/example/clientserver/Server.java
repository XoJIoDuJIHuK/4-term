package com.example.clientserver;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Scanner;

import static com.example.clientserver.Server.Topics;

public class Server {

    public static Map<String, String[]> Topics;

    public static void main(String[] args) {

        Topics = new HashMap<>();
        String[] messages = {"msg 1", "msg 33", "msg 45"};
        Topics.put("Education", messages);
        String[] messages1 = {"msg 3", "msg 53"};
        Topics.put("Healthcare", messages1);
        String[] messages2 = {"msg 123", "msg 54", "msg 21", "msg 90"};
        Topics.put("Transport", messages2);

        try {
            // Create a ServerSocket and bind it to a specific port
            ServerSocket serverSocket = new ServerSocket(1234);

            System.out.println("Server started. Waiting for client connections...");

            while (true) {
                // Accept client connections
                Socket clientSocket = serverSocket.accept();

                // Get the input and output streams for the client socket
                Scanner in = new Scanner(clientSocket.getInputStream());
                PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);

                while (true) {
                    // Read input from the client and send a response
                    String clientMessage = in.nextLine();
                    if (Objects.equals(clientMessage, "disconnect")) break;
                    if (Objects.equals(clientMessage, "/topics")) {
                        java.util.Set<String> keys = Topics.keySet();
                        for (String key : keys) {
                            out.println(key);
                        }
                    }
                    else {
                        if (Topics.containsKey(clientMessage)) {
                            String[] mesgs = Topics.get(clientMessage);
                            for (String m : mesgs) {
                                out.println(m);
                            }
                        }
                        else out.println("No such topic");

                    }
                    out.println("ENDL");
                    System.out.println("Received from client: " + clientMessage);
                }

                // Close the client socket
                clientSocket.close();
                System.out.println("Client disconnected: " + clientSocket.getInetAddress().getHostAddress());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}