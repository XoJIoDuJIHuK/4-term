package University;

import java.util.*;
public class university implements Runnable {
    private static Boolean firstDoor;
    private static Boolean secondDoor;
    private Student student;

    public university(Boolean door1, Boolean door2, Student student) {
        firstDoor = door1;
        secondDoor = door2;
        this.student = student;
    }

    private void ToOccupyDoor(Boolean door) throws InterruptedException {
        door = false;
        System.out.println(student.getName() + " ждёт дверь ");
        Thread.sleep(100);
        door = true;
        throw new InterruptedException();
    }

    public void run() {
        System.out.println(student.getName() + " начал(a) " + (student.getInOrOut() ? " вход " : " выход "));
        synchronized (this) {
            try {
                if (!firstDoor) {
                    while (!firstDoor)
                        if (!secondDoor)
                            Thread.sleep(100);
                        else {
                            System.out.println(student.getName() + " поменял(а) дверь ");
                            ToOccupyDoor(secondDoor);
                        }
                    ToOccupyDoor(firstDoor);
                } else
                    ToOccupyDoor(firstDoor);
            } catch (InterruptedException e) {
                System.out.println(student.getName() + " возобновил(а) " + (student.getInOrOut() ? " вход " : " выход "));
            }
        }
        System.out.println(student.getName() + " закончил(a) " + (student.getInOrOut() ? " вход " : " выход "));
    }

    public static void Task(List<Student> students) {
        System.out.println();
        System.out.println();

        Boolean door1 = true,
                door2 = true;
        List<Thread> threads = new ArrayList<Thread>();

        for (Student student : students) {
            Thread thread = new Thread(new university(door1, door2, student));
            thread.setName(student.getName());
            threads.add(thread);
            thread.start();
        }

        try {
            for (Thread thread : threads) {
                thread.join();
            }
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
    }
}
