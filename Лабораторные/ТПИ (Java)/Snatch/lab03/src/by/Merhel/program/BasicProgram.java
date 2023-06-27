package by.Merhel.program;

public abstract class BasicProgram {
    public int duration;
    public type prType;
    public String company;
    public String name;


    public int getDuration() {return duration;}
    public type getPrType(){return prType;}
    public String getCompany(){return company;}
    public void copy(BasicProgram b){
        this.duration=b.duration;
        this.company=b.company;
        this.name=b.name;
        this.prType=b.prType;
    }

}
