import java.lang.Thread;
import java.util.concurrent.Semaphore;
//TODO maven
public class Main {

    public static final int OPERATORSCOUNT=2;
    public static final int CLIENTSCOUNT=5;

    public static void main(String[] args) {

        CallCenter center=new CallCenter(OPERATORSCOUNT);

        for (int i = 0; i < CLIENTSCOUNT; i++) {
            (new Client (i, center)).start();
            try{
                Thread.sleep(500);
            }
            catch(InterruptedException e){

            }
        }

        Semaphore sem = new Semaphore(2);
        for(int i=1;i<6;i++)
        new Vehicle(i, sem).start();
    }
}

class Vehicle extends Thread {
    String name;
    public boolean isStayed = false;
    Semaphore sem;
    int n;

    public Vehicle(int n, Semaphore sem) {
        this.n = n;
        this.sem = sem;
    }

    int num = 0;

    @Override
    public void run() {
        try {
            while (num < 3) {
                sem.acquire();
                System.out.println(this.n + " припарковался");
                Thread.sleep(400);
                num++;
                System.out.println(this.n + " освобождает разрешение");
                sem.release();
                Thread.sleep(300);
            }
        } catch (InterruptedException e) {

        }
    }
}