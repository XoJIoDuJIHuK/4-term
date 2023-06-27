package Model;

public class User {
    private int id;
    private String login;
    private String password;
    private UserType role;

    public User(String login, String password, UserType role){
        this.login = login;
        this.password = password;
        this.role = role;
    }

    public  User() {}

    public int getID() {return id;}
    public void setID(int id) { this.id = id;}

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserType getRole() {
        return role;
    }

    public void setRole(UserType role) {
        this.role = role;
    }

    public String GetPublicInfo() {
        return "login: " + login + ", role: " + (role == UserType.User ? "user" : "admin");
    }
}