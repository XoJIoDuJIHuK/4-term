package staff.engineers.developers;

import staff.Staff;

import java.util.Comparator;

public class DevComparator implements Comparator<Staff> {
    @Override
    public int compare(Staff o1, Staff o2) {
        return (o1.skill == o2.skill && o1.salary == o2.salary) ? 0 : (o1.salary < o2.salary ? -1 : 1);
    }
}
