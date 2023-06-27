package com.example.clientserver;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;
import java.util.Locale;

public class customTagFunction extends TagSupport {
    private String varName;

    public void setVarName(String varName) {
        this.varName = varName;
    }
    private String doSomethingWithParameter() {
        return varName.toLowerCase(Locale.ROOT);
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.write("<div style=\"background-color:red;color:white\">" + doSomethingWithParameter()
                    + "</div>\n");
        } catch (Exception e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }
}
