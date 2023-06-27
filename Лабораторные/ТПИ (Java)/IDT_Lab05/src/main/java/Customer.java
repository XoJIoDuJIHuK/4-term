import java.util.Random;

public class Customer {
    private int id;
    private Boolean isServiced = false;
    public Customer(int id)
    {
        this.id = id;
    }
    public void DoStuff() throws InterruptedException {
        do {
            CallQueue.AddLast(this);
            Random random = new Random();
            Thread.sleep(random.nextInt(1000, 5000));//delay before end of call
            CallQueue.Remove(this);
            Thread.sleep(random.nextInt(2000, 4000));//delay before recall
        } while (!isServiced && Main.mayContinue);
    }

    @Override
    public String toString() {
        return String.valueOf(this.id);
    }
}
