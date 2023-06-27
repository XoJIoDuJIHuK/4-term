package Filters;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;

@WebListener()
public class RequestListener implements ServletRequestListener
{
    public void requestInitialized(ServletRequestEvent ev)
    {
// будет использован для получения информации о запросе
        HttpServletRequest req = (HttpServletRequest) ev.getServletRequest();
        String uri = "Запрос инициализирован: " + req.getRequestURI();
        String id = "Идентификатор запроса ID="+ req.getRequestedSessionId();
        System.out.println(uri + "\n" + id);
        ServletContext context = ev.getServletContext();
// счетчик числа созданных запросов
        Integer reqCount = (Integer)req.getSession().getAttribute("counter");
        if(reqCount == null) {
            reqCount = 0;
        }
        context.log(uri + "\n" +id + ", Счётчик запросов =" + reqCount);
    }
    public void requestDestroyed(ServletRequestEvent ev)
    {
        System.out.println("Запросов отклонено: " + ev.getServletRequest().getAttribute("lifecycle"));
    }
}