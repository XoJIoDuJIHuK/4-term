
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;
public class Road implements Runnable {
    private static Semaphore security;

    private static final int TIME_TO_WAIT = 200;
    private static final String WANTS_TO_TAKE_PLACE = " хочет проехать ";
    private static final String RIDE = " едет ";
    private static final String WAITING = " ждёт ";
    private static final String CARS = "Машина номер ";
    private static final String OVER = " проехала ";

    private static int maxCarsCount = 3;
    private static int cars = 0;


    public void run() {
        try {
            System.out.println(Thread.currentThread().getName() + WANTS_TO_TAKE_PLACE);

            while (true) {
                if (cars < 3) {
                    security.acquire();
                    cars++;

                    System.out.println(Thread.currentThread().getName() + RIDE);
                    Thread.sleep(TIME_TO_WAIT);

                    security.release();
                    cars--;
                    break;
                }else {
                    System.out.println(Thread.currentThread().getName() + WAITING);
                    Thread.sleep(TIME_TO_WAIT);
                }
            }
        }catch (InterruptedException e){
            System.out.println(e.getMessage());
        }
        finally {
            System.out.println(Thread.currentThread().getName() + OVER);
        }
    }

    public static void Task(int CarsCount){
        System.out.println();
        System.out.println();

        security = new Semaphore(3);
        List<Thread> threads = new ArrayList<Thread>();

        for (int i = 0; i < CarsCount; i++){
            Thread road = new Thread(new Road());
            road.setName(CARS + i);
            threads.add(road);
            road.start();
        }

        try {
            for (Thread thread : threads){
                thread.join();
            }
        }catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
    }
}