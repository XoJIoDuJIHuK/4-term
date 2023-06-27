package by.belstu.it.tachyla.basejava;

import java.util.Objects;

public class StringWrapper {
    private String prvStr = "qwerty";

    public StringWrapper(String prvStr) {
        this.prvStr = prvStr;
    }

    public String getPrvStr() {
        return prvStr;
    }

    public void setPrvStr(String prvStr) {
        this.prvStr = prvStr;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StringWrapper that = (StringWrapper) o;
        return Objects.equals(prvStr, that.prvStr);
    }

    @Override
    public int hashCode() {
        return Objects.hash(prvStr);
    }

    @Override
    public String toString() {
        return "StringWrapper{" +
                "prvStr='" + prvStr + '\'' +
                '}';
    }

    public void replace (char oldchar, char newchar)
    {
        prvStr = prvStr.replace(oldchar, newchar);
    }
    public void Write()
    {
        System.out.println(prvStr);
    }
}
