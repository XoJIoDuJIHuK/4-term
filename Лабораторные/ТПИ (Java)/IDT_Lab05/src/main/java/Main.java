import java.util.ArrayList;
import java.util.List;

public class Main {
    public static Boolean mayContinue = true;
    public static long startTime = System.currentTimeMillis();
    public static void main(String[] args) throws InterruptedException {
        //Task1, call-center
        int n = 2;//supporters
        int m = 10;//customers

        CallQueue callQueue = new CallQueue(new Object());
        ArrayList<Supporter> supporters = new ArrayList<>();
        ArrayList<SupporterThread> supportersThreads = new ArrayList<>();
        for (int i = 0; i < n; i++)
        {
            supporters.add(new Supporter(i));
            supportersThreads.add(new SupporterThread(supporters.get(i)));
        }
        ArrayList<CustomerThread> customersThreads = new ArrayList<>();
        ArrayList<Customer> customers = new ArrayList<>();
        for (int i = 0; i < m; i++)
        {
            customers.add(new Customer(i));
            customersThreads.add(new CustomerThread(customers.get(i)));
        }
        for (SupporterThread supportersThread : supportersThreads) {
            supportersThread.start();
        }
        for (CustomerThread customersThread : customersThreads) {
            customersThread.start();
        }
        Thread.sleep(10000);
        mayContinue = false;
    }
}
