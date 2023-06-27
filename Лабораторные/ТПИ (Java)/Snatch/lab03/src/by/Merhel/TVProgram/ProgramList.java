package by.Merhel.TVProgram;

import by.Merhel.program.BasicProgram;

import java.util.ArrayList;

public class ProgramList {
    public int countPr=0;
    public String day;
    public ArrayList<BasicProgram> Programs=new ArrayList<>();

    public ProgramList(String day)
    {
        this.day=day;
    }
    public int getCountPr(){return this.countPr;}
    public void setCountPr(int count){ this.countPr=count;}
    public ArrayList<BasicProgram> getPrograms(){return this.Programs;}
    public void setPrograms(ArrayList<BasicProgram> Prgrms){this.Programs=Prgrms;}

    public void AddProgram(BasicProgram pr)
    {
        Programs.add(pr);
        countPr++;
    }
}
