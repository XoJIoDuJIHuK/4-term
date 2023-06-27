package by.Merhel.Main;

import by.Merhel.Parser.SaxParser;
import by.Merhel.TVProgram.ProgramList;
import by.Merhel.director.TVDirector;
import by.Merhel.program.AdultContent;
import by.Merhel.program.BasicProgram;
import by.Merhel.program.FamilyContent;
import by.Merhel.program.type;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.beans.XMLDecoder;
import java.beans.XMLEncoder;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Main {
    private static final Logger logger = Logger.getLogger(Main.class.getName());
    public static void main(String[] args) {
        try {
            logger.info("hi");
            AdultContent p1 = new AdultContent(type.cartoon, 100, "Adult Swim", "Rick and Morty");
            AdultContent p2 = new AdultContent(type.cartoon, 200, "Adult Swim", "King ofthe Hill");
            FamilyContent p3 = new FamilyContent(type.cartoon, 15, "CNetwork", "We Bare Bears");
            FamilyContent p4 = new FamilyContent(type.cartoon, 15, "Disney Pr", "Mary Poppins");

            ProgramList list = new ProgramList("Tuesday");
            list.AddProgram(p1);
            list.AddProgram(p2);
            list.AddProgram(p3);
            list.AddProgram(p4);

            TVDirector.SubDir sub = new TVDirector.SubDir("Jack");
            TVDirector director = new TVDirector("Steve", sub);
            director.PrintList(list);

            //-------------Parsing----------------------------------
            System.out.println("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser parser = factory.newSAXParser();

            SaxParser saxp = new SaxParser();
            parser.parse(new File("files/SaxParser.xml"), saxp);
            FamilyContent content= saxp.getResult();
            System.out.println("Name: "+content.name);
            System.out.println("Production: "+content.company);
            System.out.println("Duration: "+content.duration);
            System.out.println("Content type: "+content.prType);


            System.out.println("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            System.out.println("\t\t\t\t\tСериализация XML");
            FileOutputStream out = new FileOutputStream("files/Serialize.xml");
            XMLEncoder xmlEncoder = new XMLEncoder(out);
            xmlEncoder.writeObject(content);
            xmlEncoder.close();
            //--Десиреализация XML
            System.out.println("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            System.out.println("\t\t\t\t\tДесериализация XML");
            FileInputStream in = new FileInputStream("files/Serialize.xml");
            XMLDecoder xmlDecoder = new XMLDecoder(in);
            FamilyContent content1 = (FamilyContent) xmlDecoder.readObject();
            xmlDecoder.close();
            System.out.println("Name: "+content1.name);
            System.out.println("Production: "+content1.company);
            System.out.println("Duration: "+content1.duration);
            System.out.println("Content type: "+content1.prType);
            //--Сериализация Json
            System.out.println("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            System.out.println("\t\t\t\t\tСериализация JSON");
            Gson gson = new GsonBuilder().create();
            String json = gson.toJson(content);
            System.out.println(json);
            FileOutputStream jsonOut = new FileOutputStream("files/Serialize.json");
            byte[] outText = json.getBytes(StandardCharsets.UTF_8);
            jsonOut.write(outText, 0, outText.length);
            //--Десериализация Json
            System.out.println("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            System.out.println("\t\t\t\t\tДесериализация JSON");
            Scanner scanner = new Scanner(new File("files/Serialize.json"));
            String res = "";
            while(scanner.hasNext())
                res += scanner.nextLine();
            scanner.close();
            FamilyContent content2 = gson.fromJson(res, FamilyContent.class);
            System.out.println("Name: "+content2.name);
            System.out.println("Production: "+content2.company);
            System.out.println("Duration: "+content2.duration);
            System.out.println("Content type: "+content2.prType);


            //--Stream API
            System.out.println("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            System.out.println("\t\t\t\t\tStream API");
            Stream<BasicProgram> res_stream = list.Programs.stream().filter(w -> w.duration > 100);
            for(var x: res_stream.collect(Collectors.toList()))
            {
                System.out.println(x.name + " " + x.duration);
            }
            System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            Stream<BasicProgram> res_stream2 = list.Programs.stream().limit(2);
            for(var x: res_stream2.collect(Collectors.toList()))
            {
                System.out.println(x.name + " " + x.duration);
            }
        }
        catch(Exception e)
    {
        System.out.print(e.getMessage());
        logger.info(e.getMessage() + e);

    }
    }

}
