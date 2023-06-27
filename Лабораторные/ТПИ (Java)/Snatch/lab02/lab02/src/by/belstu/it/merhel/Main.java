package by.belstu.it.merhel;

public class Main {
    public static void main(String[] args)
    {
        System.out.println("Hello");

        TextFunctionRenamed text= new TextFunctionRenamed();

        for (int i=0; i<9; i++)
        {
            if (i>-1) {
                if (i<10)
                    System.out.println(i);
            }
        }

        for (int count = 0; count < 10; count++) {
            System.out.println("Counter "+count);
        }
    }
}
