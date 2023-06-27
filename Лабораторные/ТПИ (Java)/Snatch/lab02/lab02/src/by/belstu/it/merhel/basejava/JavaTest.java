package by.belstu.it.merhel.basejava;

import java.io.Console;
import java.nio.charset.StandardCharsets;

import static java.lang.Math.*;

/**Лабораторная работа №2. Основы Java
 * @author Caroline Merhel
 * @version 1.0.0
 */

public class JavaTest {

    static int op;
    final int fi=0;
    public final int pfi=0;
    public static final int psfi=0;

    /**Метод main - точка входа в приложение
     * @return не возвращает никакого значения
     * @throws ArithmeticException возникает при делении на ноль
     * @param args - массив аргументов командной строки
     */
    public static void main(String[] args) {
        char ch='c';
        int i=1;
        short s=123;
        byte by=12;
        long l= 1;
        boolean b=true;

        String ss= (String) "abc"+i;
        String s1=(String) "abc"+ch;
        String s2=(String) "abc"+(double) 123.132;
        by+=i;
        double d=123.132;
        int n=(int)(d+l);
        long ll= i + 2147483647;
        boolean bb=true&&false;
        boolean aa=true^true;

        long ii=9223372036854775807l;
        long lo=0x7fff_ffff_fffl;

        char a='a';
        char a1='\u0061';
        char a2=97;
        a2+=a+a1;

        double dd=3.45%2.4;
        double d1=1.0/0.0;
        double d2=0.0/0.0;
        double d3=java.lang.Math.log(-345);

        float ff=Float.intBitsToFloat(0x7F800000);
        float f1=Float.intBitsToFloat(0xFF800000);

        //TODO в каких системах счисления можно записывать целые константы?
        //в 2, в 10,в 16

        final int MY_CONST = 9784;
        final int MY_CONST2=8416;
        System.out.println("Константа №1 = " + MY_CONST + " Константа №2 = " + MY_CONST2);


        System.out.printf("Math.PI = %s%n",PI);
        System.out.printf("Math.E = %s%n",E);
        System.out.printf("round Math.PI = %s%n",Math.round(PI));
        System.out.printf("round Math.E = %s%n",Math.round(E));
        System.out.printf("min: %s%n",Math.min(PI,E));


        System.out.println("Псевдослучайное целое число: " +random()% 2);

        //--------------------------------------------------------------------
        Boolean wrapBool = new Boolean( false );
        Boolean wrapBool2 = new Boolean( true );
        System.out.println(wrapBool& wrapBool2);//and

        char c = '9';
        Character cl = new Character(c);
        System.out.println("Character = " + c);

        Integer num1 = new Integer(6);//классы обертки
        Integer num2 = new Integer(1);
        System.out.println("Сдвиги Integer(>>>,<<,>>)");
        System.out.println(num1 >>> num2); // Беззнаковый сдвиг
        System.out.println(num1 << num2);
        System.out.println(num1 >> num2);

        Integer integer = 9;//упаковка
        int integer2=integer;//распаковка
        System.out.println("Упаковка "+integer);
        System.out.println("Распаковка "+integer2);

        Byte aaa =  127;//упаковка
        byte aaa2 = aaa;//распаковка
        System.out.println("Упаковка "+aaa);
        System.out.println("Распаковка "+aaa2);

        System.out.println("Max value Long = "+Long.MAX_VALUE);
        System.out.println("Min value Long = "+Long.MIN_VALUE);

        System.out.println("Max value Double = "+Double.MAX_VALUE);
        System.out.println("Min value Double = "+Double.MIN_VALUE);

        int par = Integer.parseInt("444",16);
        System.out.println("ParseInt "+par);

        String hex = Integer.toHexString(170);
        System.out.println("toHexString "+hex);

        System.out.println("compare(100,100) = "+Integer.compare(100, 100));
        System.out.println("compare(101,100) = "+Integer.compare(101, 100));
        System.out.println("compare(100,101) = "+Integer.compare(100, 101));

        System.out.println("toString(1002) = "+Integer.toString(1002));

        //---------------------------------------------------------------------
        String s34 = "2345";
        int s35 = Integer.parseInt(s34);
        System.out.println("Преобразование String в int = "+s35);
        Integer i2 = Integer.valueOf(s34);
        System.out.println("Преобразование через valueof String в int = "+i2);
        Integer i1 = new Integer("2345");
        System.out.println("Преобразование через конструктор String в int = "+i1);

        byte[] toArr =s34.getBytes(StandardCharsets.UTF_8);
        System.out.println("переводит строки в массив байтов = "+toArr);
        String backToStr = new String(toArr,StandardCharsets.UTF_8);
        System.out.println("переводит  массив байтов в строку = "+backToStr);

        String string1 = "привет";
        String string2 = "привет";
        System.out.println(string1==string2);
        System.out.println("Equals? "+string1.equals(string2));
        System.out.println("CompareTo = "+string1.compareTo(string2));

        String str2 = "geekss@for@geekss";
        String [] arrOfStr = str2.split("@", 3);
        for (String ac : arrOfStr)
            System.out.print(" split ="+ac);


        String name="what do you know about me";// содержит ли одна строка другую
        System.out.println("\n"+name.contains("do you know"));//true

        String Str = new String("Добро пожаловать");
        System.out.println("Хэш-код для Str: " + Str.hashCode());
        System.out.println("Length для Str: " + Str.length());

        //-----------------------------------------------------------------------
        char[][] c1;
        c1 = new char[3][];
        c1[0] = new char[1];
        c1[1] = new char[2];
        c1[2] = new char[3];

        c1[0][0] = 'a';
        c1[1][0] = 'd';
        c1[1][1] = 'a';
        c1[2][0] = 'n';
        c1[2][1] = 'e';
        c1[2][2] = 't';

        System.out.println("Length для Str1: " +c1[0].length);
        System.out.println("Length для Str2: " +c1[1].length);
        System.out.println("Length для Str3: " +c1[2].length);

        char[][] c2 = new char[2][3];
        c2[0][0] = 'o';
        c2[0][1] = 'p';
        c2[0][2] = 'a';
        c2[1][0] = 'c';
        c2[1][1] = 'k';
        c2[1][2] = 'i';

        char[][] c3 = new char[2][3];
        c2[0][0] = 'o';
        c2[0][1] = 'p';
        c2[0][2] = 'a';
        c2[1][0] = 'c';
        c2[1][1] = 'k';
        c2[1][2] = 'i';

        //boolean comRez = с2==с3;
        //с2 = с3;
        System.out.println("-----c1:");
        for (char[] xz : c1) {
            System.out.println(xz);
        }
        System.out.println("-----c2:");
        for (char[] xz : c2) {
            System.out.println(xz);
        }
        System.out.println("-----c3:");
        for (char[] xz : c3) {
            System.out.println(xz);
        }
        //---------------------------
        WrapperString sw = new WrapperString("A,B,C");
        sw.replace(',',';');
        System.out.println(sw.getStr());
        sw.delete('A');
        System.out.println(sw.getStr());
    }
}

