package controller;



import exceptions.ModelException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;

import static models.AddNation.AddNationMethod;
import static models.DelNation.DelNationMethod;
import static models.Page.PageMethod;
import static models.Register.RegisterMethod;
import static models.UpdNation.UpdateNationMethod;
import static models.Welcome.WelcomeMethod;

public class Controller extends HttpServlet {

    private void WriteToLog(String message) throws IOException {
        String path = "D:/log.txt";
        File log = new File(path);
        String a = log.getAbsolutePath();
        FileWriter fw = new FileWriter(path, true);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write(message + "\n");
        bw.newLine();
        bw.close();
    }

    private static final String COMMAND="command";
    public static final String LOGIN="login";
    public static final String REGISTER="register";
    public static final String PAGE="page";
    public static final String ADD_NATION="addNation";
    public static final String DEL_NATION="delNation";
    public static final String UPD_NATION="updNation";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req,resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            processRequest(req,resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private void processRequest(HttpServletRequest request,HttpServletResponse response) throws Exception {
        String command = request.getParameter(COMMAND);
        switch (command){
            case LOGIN:{
                WelcomeMethod(request,response);
                break;
            }
            case REGISTER:{
                RegisterMethod(request,response);
                break;
            }
            case PAGE:{
                PageMethod(request,response);
                break;
            }
            case ADD_NATION:{
                AddNationMethod(request,response);
                break;
            }
            case DEL_NATION:{
                DelNationMethod(request,response);
                break;
            }
            case UPD_NATION: {
             UpdateNationMethod(request,response);
             break;
            }
            default: {
                WriteToLog("Error while trying to execute command " + command);
                return;
            }
            }
            WriteToLog("Successfully executed command " + command);
        }
    }


