public class Supporter {
    private int id;
    public Supporter(int id)
    {
        this.id = id;
    }
    public void DoStuff() throws InterruptedException {
        while (Main.mayContinue)
        {
            CallQueue.RemoveFirst(this);
            Thread.sleep(1000);
        }
        System.out.println("interrupted");
    }

    @Override
    public String toString() {
        return Integer.toString(id);
    }
}
