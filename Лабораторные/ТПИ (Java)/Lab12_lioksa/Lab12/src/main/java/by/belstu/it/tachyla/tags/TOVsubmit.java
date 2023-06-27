package by.belstu.it.tachyla.tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.*;

import java.io.IOException;

public class TOVsubmit extends TagSupport {
    @Override
    public int doStartTag() throws JspException {
        String html =
                "<input type='submit' value='Вход'/>" +
                "<input type='submit' value='Регистрация'/>";
        try {
            JspWriter out = pageContext.getOut();
            out.write(html);
        } catch (IOException e) {
            throw new JspException(e.getMessage());
        }
        return SKIP_BODY;
    }
}
