package main;
import company.Company;
import staff.Skills;
import staff.engineers.developers.Junior;

import com.google.gson.*;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.util.ArrayList;
import java.util.stream.Stream;

public class Main {
    public static void main(String[] args) {

        try
        {
            var Google = new Company();
            Google.director.CountEmployees();
            Google.director.PrintEngineersBySkill(Skills.ADVANCED);
            Google.director.Sort("salary");

            System.out.println("\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
            ArrayList<Junior> EmployeeList = new ArrayList<>();

            ArrayList<String> skills = new ArrayList<>();
            ArrayList<String> salaries = new ArrayList<>();

            SaxStreamProcessor.addNamesToList("skill", skills);
            SaxStreamProcessor.addNamesToList("salary", salaries);

            for (int i = 0; i < skills.size(); i++)
            {
                Skills skill;
                switch (skills.get(i)) {
                    case "UNDER_INTERMEDIATE" -> {
                        skill = Skills.UNDER_INTERMEDIATE;
                    }
                    case "INTERMEDIATE" -> {
                        skill = Skills.INTERMEDIATE;
                    }
                    case "UPPER_INTERMEDIATE" -> {
                        skill = Skills.UPPER_INTERMEDIATE;
                    }
                    case "IMPROVED" -> {
                        skill = Skills.IMPROVED;
                    }
                    case "ADVANCED" -> {
                        skill = Skills.ADVANCED;
                    }
                    case "SUPERIOR" -> {
                        skill = Skills.SUPERIOR;
                    }
                    default -> {
                        skill = Skills.AWFUL;
                    }
                }
                EmployeeList.add(new Junior(
                    Integer.parseInt(salaries.get(i)),
                    skill
                ));
            }

            System.out.println("Parsed employees:");
            for (var e : EmployeeList)
            {
                System.out.println(e.toString());
            }

            Gson gson=new Gson();
            String json = gson.toJson(EmployeeList);
            System.out.println();
            System.out.println(json);

            File schemaFile = new File("files/validation.xsd");
            Source xmlFile = new StreamSource(new File("files/EmployeeList.xml"));
            SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI); // нужно для считывания схемы
            Schema schema = schemaFactory.newSchema(schemaFile);
            Validator validator = schema.newValidator();
            validator.validate(xmlFile);
            System.out.println("\nXML-файл успешно прошёл валидацию с XSD!");
            Stream<Junior> stream = Stream.of(EmployeeList.get(0), EmployeeList.get(1), EmployeeList.get(2), EmployeeList.get(3));
            stream.sorted(new JunComparator()).forEach(System.out::println);
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }

    }
}