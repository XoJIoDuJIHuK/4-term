package DB;

public class Med {
    private int id;
    private String name;
    private String adress;
    private String phone;

    public Med(String name, String adress, String phone) {
        this.name = name;
        this.adress = adress;
        this.phone = phone;
    }


    public Med() { }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String teacher) {
        this.adress = adress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String faculty) {
        this.phone = phone;
    }
}
