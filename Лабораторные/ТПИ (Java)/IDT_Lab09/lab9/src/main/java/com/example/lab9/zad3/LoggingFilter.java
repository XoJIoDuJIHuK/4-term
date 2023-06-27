package com.example.lab9.zad3;

import java.io.IOException;
import java.util.Date;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

public class LoggingFilter implements Filter {
    private static final Logger logger = Logger.getLogger(LoggingFilter.class.getName());
    private FileHandler fileHandler;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        try {
            // Создание обработчика, который будет записывать логи в файл "log.txt"
            fileHandler = new FileHandler("C:\\Users\\user\\Desktop\\log.txt", true);
            fileHandler.setFormatter(new SimpleFormatter());
            // Добавление обработчика в логгер
            logger.addHandler(fileHandler);
            // Установка уровня логирования (ALL - запись всех сообщений)
            logger.setLevel(Level.ALL);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String method = httpRequest.getMethod();
        String uri = httpRequest.getRequestURI();
        String ip = request.getRemoteAddr();
        Date date = new Date();
        logger.log(Level.INFO, String.format("[%s] %s %s %s", date.toString(), ip, method, uri));

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Закрытие обработчика при уничтожении фильтра
        fileHandler.close();
    }
}

