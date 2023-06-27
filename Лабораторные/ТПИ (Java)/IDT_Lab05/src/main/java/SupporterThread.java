public class SupporterThread extends Thread {
    private Supporter supporter;
    public SupporterThread(Supporter s)
    {
        supporter = s;
    }

    @Override
    public void run() {
        try {
            supporter.DoStuff();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
