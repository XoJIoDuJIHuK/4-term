public class CustomerThread extends Thread{
    private Customer customer;
    public CustomerThread(Customer c)
    {
        customer = c;
    }

    @Override
    public void run() {
        try {
            customer.DoStuff();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
