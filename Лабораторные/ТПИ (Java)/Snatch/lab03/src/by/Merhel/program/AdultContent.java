package by.Merhel.program;

public class AdultContent extends BasicProgram{

    public AdultContent(type prType,int duration, String company,String name)
    {
        this.prType=prType;
        this.duration=duration;
        this.company=company;
        this.name=name;

    }

    public String contentStatus(){ return  " adult "+this.prType+" content is on TV";}
}
