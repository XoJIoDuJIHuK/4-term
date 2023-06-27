package by.Merhel.director;

import by.Merhel.TVProgram.ProgramList;
import by.Merhel.program.BasicProgram;
import by.Merhel.program.FamilyContent;
import by.Merhel.program.type;

import java.util.Collections;
import java.util.Comparator;

public class TVDirector implements IDirector {
    public String name;
    public SubDir sub;
    public TVDirector(String name, SubDir sub){
        this.name=name;
        this.sub=sub;
    }

    public void PrintList(ProgramList list)
    {
        System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
        System.out.println("\t\t\t\t\t\t\t"+list.day);
        System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
        System.out.println("N \tProgram \t\t\tProduction \t\t\tType \t\tDuration");
        int counter=1;
        for (BasicProgram pr: list.Programs) {
            System.out.println(counter+"\t"+pr.name+"\t\t"+pr.getCompany()+"\t\t\t"+pr.getPrType()+"\t\t"+pr.getDuration());
            counter++;
        }
    }
    @Override
    public BasicProgram getLongestPr(ProgramList list){
        FamilyContent tmp=new FamilyContent();
        for (BasicProgram pr: list.Programs) {
            if (pr.duration>=tmp.duration) tmp.copy(pr);
        };
        return tmp;
    };
    @Override
    public BasicProgram getTypePr(ProgramList list, type t){
        for (BasicProgram b: list.Programs) {
            return b;
        };
        return new FamilyContent();
    };
    @Override
    public int getAllLength(ProgramList list){
        int count=0;
        for (BasicProgram b:list.Programs) {
            count+=b.duration;
        }
        return count;
    };

    @Override
    public void sortByDuration(ProgramList list){
        Collections.sort(list.Programs, new Comparator<BasicProgram>() {
            @Override
            public int compare(BasicProgram o1, BasicProgram o2) {
                if (o1.duration> o2.duration) return 1;
                else if (o2.duration> o1.duration) return -1;
                else return 0;
            }
        });
    };

    public static class SubDir
    {
        public String name;
        public SubDir(String name)
        {
            this.name=name;
        }
    }
}
