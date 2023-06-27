package test;


import org.junit.jupiter.api.Assertions;
import org.testng.annotations.Test;
import entities.users;
import org.junit.jupiter.api.Tag;

public class UsersTest {

    @Test
    public void testUserConstructorWithThreeParameters() {
        String login = "user1";
        String password = "pass1";
        String role = "admin";
        users user = new users(login, password, role);

        Assertions.assertEquals(login, user.getUsername());
        Assertions.assertEquals(password, user.getPassword());
        Assertions.assertEquals(role, user.getRole());
    }

    @Test
    public void testGettersAndSetters() {
        int id = 12;
        String login = "user1";
        String password = "pass1";
        String role = "admin";
        users user = new users();

        user.setUsername(login);
        user.setPassword(password);
        user.setRole(role);

        Assertions.assertEquals(login, user.getUsername());
        Assertions.assertEquals(password, user.getPassword());
        Assertions.assertEquals(role, user.getRole());
    }
}
