package main;

import staff.engineers.developers.Junior;
import java.util.Comparator;

class JunComparator implements Comparator<Junior> {

    @Override
    public int compare(Junior o1, Junior o2) {
        return Double.compare(o1.salary, o2.salary);
    }
}
