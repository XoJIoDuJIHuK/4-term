package by.Merhel.Parser;

import by.Merhel.program.FamilyContent;
import by.Merhel.program.type;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;//библотека для саксирования

import java.util.ArrayList;
import java.util.Arrays;


public class SaxParser extends DefaultHandler {
    FamilyContent pr= new FamilyContent();
    String thisElement = "";
    @Override
    public void startDocument() throws SAXException {
        System.out.println("----> Start parse XML...");
    }

    @Override
    public void startElement(String namespaceURI, String localName, String qName, Attributes atts) throws SAXException {
        thisElement = qName;
    }

    public FamilyContent getResult()
    {
        return pr;
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        if (thisElement.equals("name")) {
            pr.name = new String(ch, start, length);
        }
        else if(thisElement.equals("duration"))
        {
            pr.duration = new Integer(new String(ch, start, length));
        }
        else if (thisElement.equals("prType"))
        {
            String a = new String(ch, start, length);
            switch (a) {
                case "cartoon": {
                    pr.prType=type.cartoon;
                    break;
                }
                case "movie": {
                    pr.prType=type.movie;
                    break;
                }
                case "documental": {
                    pr.prType=type.documental;
                    break;
                }
                case "advertisment": {
                    pr.prType=type.advertisment;
                    break;
                }
                case "news": {
                    pr.prType=type.news;
                    break;
                }
            }
        }
        else if (thisElement.equals("company"))
        {
            pr.company = new String(ch, start, length);
        }

    }
    @Override
    public void endElement(String namespaceURI, String localName, String qName) throws SAXException {
        thisElement = "";
    }

    @Override
    public void endDocument() {
        System.out.println("----> Stop parse XML...");
    }
}