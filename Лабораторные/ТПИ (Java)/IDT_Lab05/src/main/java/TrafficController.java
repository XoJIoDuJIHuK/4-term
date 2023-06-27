import java.sql.Time;
import java.util.Random;
import java.util.concurrent.Semaphore;

public class TrafficController {
    public Semaphore semaphore = new Semaphore(1);
    public int carsOnLeft = 0;
    public int carsOnRight = 0;
    public static long startTime;
    public enum sides {
        left,
        right
    }
    public sides previousSide = sides.left;

    public void passFromLeft() throws InterruptedException {
        for (int i = 0; i < 3 && carsOnLeft > 0; i++)
        {
            WriteToConsole("Car passes from left, cars on left: " + --carsOnLeft);
            Thread.sleep(500);
        }
    }
    public void passFromRight() throws InterruptedException {
        for (int i = 0; i < 3 && carsOnRight > 0; i++)
        {
            WriteToConsole("Car passes from right, cars on right: " + --carsOnRight);
            Thread.sleep(500);
        }
    }
    public void pass() throws InterruptedException {
        semaphore.acquire();
        switch (previousSide) {
            case left -> {
                if (carsOnLeft > 0) passFromLeft();
                else passFromRight();
            }
            case right -> {
                if (carsOnRight > 0) passFromRight();
                else passFromLeft();
            }
        }
        semaphore.release();
    }

    public static void WriteToConsole(String output)
    {
        System.out.println((System.currentTimeMillis() - startTime) + " -> " + output);
    }
    public void arriveFromLeft() throws InterruptedException {
        WriteToConsole("Car arrived from left, cars on left: " + ++carsOnLeft);
    }

    public void arriveFromRight() throws InterruptedException {
        WriteToConsole("Car arrived from right, cars on right: " + ++carsOnRight);
    }

    public static void main(String[] args) throws InterruptedException {
        TrafficController controller = new TrafficController();
        Thread t1 = new Thread(() -> {
            try {
                Random random = new Random();
                for (int i = 0; i < 10; i ++) {
                    controller.arriveFromLeft();
                    Thread.sleep(random.nextInt(100, 1000));
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        Thread t2 = new Thread(() -> {
            try {
                Random random = new Random();
                for (int i = 0; i < 10; i ++) {
                    controller.arriveFromRight();
                    Thread.sleep(random.nextInt(100, 1000));
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        Thread t3 = new Thread(() -> {
            try {
                while (true)
                {
                    controller.pass();
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });

        startTime = System.currentTimeMillis();


        t1.start();
        t2.start();
        t3.start();
        t1.join();
        t2.join();
        t3.join();
    }
}
