package by.belstu.it.merhel.basejava;

import java.util.Objects;

public class WrapperString {
    private String str;

    public WrapperString(String str) {
        this.str = str;
    }

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WrapperString that = (WrapperString) o;
        return Objects.equals(str, that.str);
    }

    @Override
    public int hashCode() {
        return Objects.hash(str);
    }

    @Override
    public String toString() {
        return "WrapperString{" +
                "str='" + str + '\'' +
                '}';
    }

    public void replace(char oldChar, char newChar)
    {
        str = str.replace(oldChar,newChar);
    }
    public void delete(char delChar)
    {
        str = str.replace(delChar, ' ');
    }
}
