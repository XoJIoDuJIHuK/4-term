package org.example.guessing;
import java.io.*;
import java.net.*;

public class GuessingServer {
    public static void main(String[] args) throws IOException {
        int portNumber = 4848; // порт по умолчанию

        try (
                ServerSocket serverSocket = new ServerSocket(portNumber);
                Socket clientSocket = serverSocket.accept(); // ожидаем подключение клиента
                PrintWriter out =
                        new PrintWriter(clientSocket.getOutputStream(), true);
                BufferedReader in = new BufferedReader(
                        new InputStreamReader(clientSocket.getInputStream()));
        ) {
            System.out.println("Client connected!");

            int secretNumber = (int) (Math.random() * 100); // генерируем число от 0 до 100
            System.out.println(secretNumber);
            String inputLine;
            while ((inputLine = in.readLine()) != null) { // ожидаем ввода клиента
                int guess = Integer.parseInt(inputLine); // преобразуем введенную строку в число
                if (guess == secretNumber) {
                    out.println("You win!");
                    break;
                } else if (guess < secretNumber) {
                    out.println("Too low, try again.");
                } else {
                    out.println("Too high, try again.");
                }
            }
        } catch (IOException e) {
            System.out.println("Exception caught when trying to listen on port "
                    + portNumber + " or listening for a connection");
            System.out.println(e.getMessage());
        }
    }
}
