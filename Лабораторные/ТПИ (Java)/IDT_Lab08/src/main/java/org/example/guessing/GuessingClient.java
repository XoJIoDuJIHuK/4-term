package org.example.guessing;

import java.io.*;
import java.net.*;

public class GuessingClient {
    public static void main(String[] args) throws IOException {
        String hostName = "localhost"; // хост по умолчанию
        int portNumber = 4848; // порт по умолчанию

        try (
                Socket socket = new Socket(hostName, portNumber);
                PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
                BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in))
        ) {
            String userInput;
            while ((userInput = stdIn.readLine()) != null) { // ждем ввода пользователя
                out.println(userInput); // отправляем введенную строку серверу
                String serverResponse = in.readLine(); // ожидаем ответ от сервера
                System.out.println(serverResponse);
                if (serverResponse.equals("You win!")) {
                    break;
                }
            }
        } catch (UnknownHostException e) {
            System.err.println("Don't know about host " + hostName);
            System.exit(1);
        } catch (IOException e) {
            System.err.println("Couldn't get I/O for the connection to " +
                    hostName);
            System.exit(1);
        }
    }
}
