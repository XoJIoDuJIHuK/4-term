import java.util.Random;
import java.lang.Thread;

public class Client  extends Thread {

    public int Cname;
    CallCenter center;
    Random random = new Random();

    public Client(int name, CallCenter center)
    {
        this.Cname=name;
        this.center=center;
        System.out.println("Client " + this.Cname + "  is calling");
    }

    @Override
    public void run() {
        synchronized (center) {
            if (center.getFreePlace() == -1) {
                int waitingTime = random.nextInt(1000);
                System.out.println("Client " + this.getCname() + " is waiting...");
                try{
                    center.wait(waitingTime);
                }
                catch(InterruptedException e){
                }
            }
        }
        if(center.getFreePlace() != -1){
            center.setClient(this);
            center.showOperator();
            try{
                Thread.sleep(random.nextInt(3000));
            }
            catch(Exception e){
            }

            center.leaveClient(this);
            synchronized (center){
                center.notify();
            }
        }
        else{
            System.out.println("Client " + this.getCname() + " hang up");
        }
    }

    public int getCname() {
        return this.Cname;
    }
}
