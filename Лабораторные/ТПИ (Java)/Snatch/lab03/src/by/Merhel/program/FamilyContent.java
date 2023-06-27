package by.Merhel.program;

public class FamilyContent extends BasicProgram{

    public FamilyContent(type prType, int duration, String company, String name)
    {
        this.prType=prType;
        this.duration=duration;
        this.company=company;
        this.name=name;
    }
    public FamilyContent()
    {
        this.prType=null;
        this.duration=-1;
        this.company=null;
        this.name=null;
    }
    public String contentStatus(){ return  "family "+this.prType+" content is on TV";}
}
