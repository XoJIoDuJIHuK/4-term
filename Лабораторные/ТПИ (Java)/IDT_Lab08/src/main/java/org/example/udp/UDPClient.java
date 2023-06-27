package org.example.udp;

import java.net.*;

public class UDPClient {
    public static void main(String[] args) {
        try {
            DatagramSocket socket = new DatagramSocket();


            String message = "Hello, server!";
            InetAddress address = InetAddress.getByName("localhost");
            int port = 1234;
            byte[] data = message.getBytes();
            DatagramPacket packet = new DatagramPacket(data, data.length, address, port);

            // Отправка пакета на сервер
            socket.send(packet);

            // Создание буфера для приема пакетов
            byte[] buffer = new byte[1024];

            // Создание объекта для приема пакетов
            DatagramPacket responsePacket = new DatagramPacket(buffer, buffer.length);

            // Прием ответа от сервера
            socket.receive(responsePacket);

            // Преобразование полученных данных в строку
            String responseData = new String(responsePacket.getData(), 0, responsePacket.getLength());

            // Вывод полученных данных на экран
            System.out.println("Received data: " + responseData);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
