package by.belstu.it.tachyla;

public class TextFunctionRenamed
{
    public int a;

    public void setA(int a) {
        this.a = a;
    }

    public int getA() {
        return a;
    }

    public String GetValue()
    {
        return "Hello from First project";
    }

    public TextFunctionRenamed() {
    }

    @Override
    public String toString() {
        return "TextFunctionRenamed{}";
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

}