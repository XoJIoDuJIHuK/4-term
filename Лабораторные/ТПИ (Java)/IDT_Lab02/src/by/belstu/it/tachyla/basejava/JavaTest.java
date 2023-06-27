package by.belstu.it.tachyla.basejava;

import java.math.BigInteger;

import static java.lang.Math.*;
/**
    * @author Aleh
    * @version 1.0
*/
public class JavaTest {
    static int sint;
    final int a = 1;
    public final int b = 2;
    /**
        {@value #c}
        @see by.belstu.it.tachyla.Main
     */
    public static final int c = 3;
    /**
        @param args
        @throws Exception
     */
    //returns void, return can't be used
    public static void main(String[] args) throws Exception {
        char c = 12;
        int i = 44444543;
        short s = 23423;
        byte b = 'a';
        long l = 87654327654L;
        boolean bool = false;
        String str = "";
        double d = 999999999999999999999.0;
        System.out.println(str + i);
        System.out.println(str + c);
        System.out.println(str + d);
        b = (byte)(b + i);
        i = (int)(d + l);
        l = i + 2147483647;
        System.out.println(sint);
        System.out.println(bool && bool);
        System.out.println(bool ^ bool);
        //System.out.println(bool + bool);//cannot be applied
        long l1 = (long)9223372036854775807.0;//max value of long
        BigInteger bi = new BigInteger("7ffffffffff", 16);
        System.out.println(c - 'a');
        System.out.println(c - '\u0061');
        System.out.println(c - 91);
        System.out.println(c - 91 + c - 'a' + c - '\u0061');
        System.out.println(3.45 % 2.4);
        System.out.println(1.0 / 0.0);
        System.out.println(0.0 / 0.0);
        System.out.println(String.format("logarithm: %s", log(-345)));//Cannot resolve method 'log' in 'JavaTest'
        System.out.println(Float.intBitsToFloat(0x7F800000));
        System.out.println(Float.intBitsToFloat(0xFF800000));
        System.out.println(PI);
        System.out.println(E);
        System.out.println(round(PI));
        System.out.println(round(E));
        System.out.println(min(PI, E));
        System.out.println(random());
        Boolean boolObj = Boolean.TRUE;
        Character charObj = 'a';
        Integer intObj = 123;
        Byte byteObj = 12;
        Long longObj = 23L;
        Short shortObj = 21;
        Double doubleObj = 234.1;
        System.out.println(charObj + byteObj);
        System.out.println(longObj >> 2);
        System.out.println(boolObj & true);
        System.out.println(intObj & shortObj);
        System.out.println(Long.MAX_VALUE);
        System.out.println(Double.MAX_VALUE);
        Object obj = (Object)intObj;
        intObj = (int)obj;
        obj = (Object)byteObj;
        byteObj = (byte)obj;
        System.out.println(Integer.parseInt("12345"));
        System.out.println(Integer.toHexString(12));
        System.out.println(Integer.compare(1, 2));
        System.out.println(Integer.toString(6543));
        System.out.println(Integer.bitCount(3458970));
        System.out.println(Float.isNaN(2938));
        //int i1 = new Integer("435");//deprecated
        String num = "876543";
        int i2 = Integer.valueOf(num);
        //parse уже был
        byte  byteArr[] = num.getBytes();
        String numRestored = byteArr.toString();

        bool = Boolean.parseBoolean(num);
        bool = Boolean.getBoolean(num);//false

        String str1 = "qwe";
        String str2 = "qwe";
        System.out.println("9876543245678");
        System.out.println(str == str2);
        System.out.println(str1.equals(str2));
        System.out.println(str1.compareTo(str2));
        str2 = null;
        System.out.println(str == str2);
        System.out.println(str1.equals(str2));
        //System.out.println(str1.compareTo(str2));//Exception in thread "main" java.lang.NullPointerException: Cannot
        // read field "value" because "anotherString" is null

        String[] strArr = num.split("");
        for (String value : strArr) {
            System.out.println(value);
        }
        System.out.println(num.contains("a"));
        System.out.println(num.hashCode());
        System.out.println(num.indexOf('8'));
        System.out.println(num.length());
        System.out.println(num.replace('8', 'b'));

        char[][] c1;
        char[] c2[];
        char c3[][];//lul, all three

        char[] c4 = new char[0];//acceptable
        System.out.println(c4.length);
        //System.out.println(c4[1]);//Index out of bounds

        c1 = new char[3][];
        c1[0] = new char[0];
        c1[1] = new char[1];
        c1[2] = new char[2];
        System.out.println(c1[1][0]);
        System.out.println(c1.length);
        System.out.println(c1[0].length);
        System.out.println(c1[1].length);
        System.out.println(c1[2].length);

        c2 = new char[1][1];
        c2[0][0] = 'a';
        c3 = new char[2][1];
        c3[0][0] = 'b';
        System.out.println(c2 == c3);
        c2 = c3;
        System.out.println(c2[0][0]);

        i = 0;
        for (char arr[] : c2)
        {
            for (char item : arr)
            {
                str = String.format("%d: %c", i++, item);
                System.out.println(str);
            }
        }

        for (int j = 0; j < c2[0].length + 1; j++) {
            //System.out.println(c2[0][j]);//Index 1 out of bounds for length 1
        }

        StringWrapper sw = new StringWrapper("qwerty");
        sw.Write();
        sw.replace('q', '4');
        sw.Write();
        var fsw = new StringWrapper("qwerty")
        {
            @Override
            public void replace(char oldchar, char newchar)
            {
                System.out.println("replacement");
            }
            public void delete()
            {
                setPrvStr(null);
            }
        };
        fsw.replace('q', '4');
        fsw.Write();
        fsw.delete();
        fsw.Write();
    }
}
