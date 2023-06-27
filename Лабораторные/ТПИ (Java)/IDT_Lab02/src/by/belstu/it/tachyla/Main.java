package by.belstu.it.tachyla;

import by.belstu.it.tachyla.TextFunctionRenamed;

public class Main {
    public static void main(String[] args)
    {
        TextFunctionRenamed obj = new TextFunctionRenamed();
        ExtractedMethod();
        for (int i = 0; i < 10; i++) System.out.println(2);
        for (int count = 0; count < 3; count++) {
            System.out.println("Counter "+ count);
        }
    }

    private static void ExtractedMethod() {
        System.out.println(1);
    }
}
