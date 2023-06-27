package main;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;//библотека для саксирования
import staff.Skills;
import staff.engineers.developers.Junior;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class SaxParser extends DefaultHandler {

    private ArrayList<Junior> objects;
    private int currentIndex = -1;
    private String currentElement;
    private int currentSalary;
    private Skills currentSkill;

    public SaxParser() {
        objects = new ArrayList<>();
    }

    public ArrayList<Junior> getObjects() {
        return objects;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        currentElement = qName;
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        if (qName.equals("Junior")) {
            objects.add(new Junior(currentSalary, currentSkill));
            currentIndex++;
        }
        currentElement = null;
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        String value = new String(ch, start, length).trim();
        if (currentElement != null) {
            switch (currentElement) {
                case "salary":
                    currentSalary = Integer.parseInt(value);
                    break;
                case "skill":
                    currentSkill = Skills.valueOf(value);
                    break;
            }
        }
    }
}