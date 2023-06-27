package org.example.udp;

import java.net.*;

public class UDPServer {
    public static void main(String[] args) {
        try {
            // Создание сокета для сервера
            DatagramSocket socket = new DatagramSocket(1234);

            // Создание буфера для приема пакетов
            byte[] buffer = new byte[1024];

            while (true) {
                // Создание объекта для приема пакетов
                DatagramPacket packet = new DatagramPacket(buffer, buffer.length);

                // Прием пакета от клиента
                socket.receive(packet);

                // Преобразование полученных данных в строку
                String receivedData = new String(packet.getData(), 0, packet.getLength());

                // Вывод полученных данных на экран
                System.out.println("Received data: " + receivedData);

                // Отправка ответа клиенту
                InetAddress address = packet.getAddress();
                int port = packet.getPort();
                String response = "Hello, client!";
                byte[] responseData = response.getBytes();
                DatagramPacket responsePacket = new DatagramPacket(responseData, responseData.length, address, port);
                socket.send(responsePacket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

