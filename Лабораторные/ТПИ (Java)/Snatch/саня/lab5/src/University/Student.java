package University;

import java.util.ArrayList;
import java.util.List;

public class Student {
    private String name;
    public String getName(){
        return name;
    }

    public Student(String name, boolean inOrOut){
        this.name = name;
        this.inOrOut = inOrOut;
    }

    private boolean inOrOut;
    public boolean getInOrOut(){
        return inOrOut;
    }

    public static List<Student> GetStudents(){
        List<Student> students = new ArrayList<Student>();
        students.add(new Student("Илья", true));
        students.add(new Student("Александр", false));
        students.add(new Student("Никита", true));
        students.add(new Student("Наталия", false));
        students.add(new Student("Алексей", true));
        students.add(new Student("Марина", false));
        return students;
    }
}