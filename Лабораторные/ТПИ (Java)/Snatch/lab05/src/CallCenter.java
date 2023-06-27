public class CallCenter {
    public Client[] clients;
    public int operatorsCount;

    public CallCenter(int size)
    {
        this.operatorsCount=size;
        clients = new Client[size];
    }

    public int getFreePlace() {
        for (int i = 0; i < operatorsCount; i++) {
            if (clients[i] == null)
                return i;
        }
        return -1;
    }

    public void setClient(Client client) {
        System.out.println("Client " + client.getCname() + " is placed");
        clients[getFreePlace()] = client;
    }

    public void showOperator() {
        System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-\nOperators: ");
        for (int i = 0; i < operatorsCount; i++) {
            if(clients[i] != null){
                System.out.println(i + ") " + clients[i].getCname());
            }
            else{
                System.out.println(i + ") empty");
            }
        }
        System.out.println("=-=-=-=-=-=-=-=-=-=-=-=-");
    }

    public void leaveClient(Client client) {
        for(int i=0;i<operatorsCount;i++){
            if(clients[i] == client){
                clients[i] = null;
                System.out.println("Client " + client.getCname() + " was served");
            }
        }
    }
}
