package by.belstu.it.tachyla.tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;
import org.apache.commons.text.StringEscapeUtils;

import java.sql.DriverManager;
import java.util.ResourceBundle;

public class TOVprintTable extends TagSupport {
    private String head;
    public void setHead(String head) {
        this.head = head;
    }

    @Override
    public int doStartTag() throws JspException {
        try {
            var resource = ResourceBundle.getBundle("db");
            System.out.println(resource);
            String url = resource.getString("db.url");
            String user = resource.getString("db.user");
            String password = resource.getString("db.password");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (var connection = DriverManager.getConnection(url, user, password)){
                try (var stmt = connection.createStatement()) {
                    var rs = stmt.executeQuery("select * from [" + head + "]");
                    int columnCount = rs.getMetaData().getColumnCount();
                    JspWriter out = pageContext.getOut();
                    out.write("<table style='border: 1px solid black;'>");
                    out.write("<caption>" + head + "</caption>");
                    out.println("<tr>");
                    for (int i = 1; i <= columnCount; i++) {
                        out.println("<th>" + rs.getMetaData().getColumnName(i) + "</th>");
                    }
                    out.println("</tr>");
                    while (rs.next()) {
                        out.print("<tr>");
                        for (int i = 1; i <= columnCount; i++) {
                            String data = rs.getString(i);
                            out.print("<td>" + StringEscapeUtils.escapeHtml4(data) + "</td>");
                        }
                        out.print("</tr>");
                    }
                    out.write("</table>");
                }
            }
        } catch (Exception e) {
            throw new JspException(e);
        }
        return SKIP_BODY;
    }
}