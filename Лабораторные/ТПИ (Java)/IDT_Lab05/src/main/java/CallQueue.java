import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;

public class CallQueue {
    private static Object godObject;
    public CallQueue(Object obj)
    {
        godObject = obj;
    }
    public static LinkedList<Customer> queue = new LinkedList<>();
    public static void AddLast(Customer c)
    {
        synchronized (godObject)
        {
            System.out.println("Customer " + c.toString() + " initialized a call at " +
                    (System.currentTimeMillis() - Main.startTime));
            queue.addLast(c);
        }
    }
    public static void Remove(Customer c)
    {
        synchronized (godObject)
        {
            if (queue.contains(c))
            {
                System.out.println("Customer " + c.toString() + " did not wait till service and ended the " +
                        "call at " + (System.currentTimeMillis() - Main.startTime));
                queue.remove(c);
            }
        }
    }
    public static void RemoveFirst(Supporter s)
    {
        synchronized (godObject)
        {
            if (queue.size() > 0)
            {
                Customer c = queue.removeFirst();
                System.out.println("Customer " + c.toString() + " was serviced by supporter " +
                        s.toString() + " at " + (System.currentTimeMillis() - Main.startTime));
            }
        }
    }
}
