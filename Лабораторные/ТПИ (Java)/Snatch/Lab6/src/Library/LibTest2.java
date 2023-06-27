package Library;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;

public class LibTest2 {
    private Books a  = new Books();
    @Before
    public void initObj()
    {
        a.author = "Kek";
        a.id_book = 1;
        a.name_of_book = "Kek2";
        a.publishing_house = "Kek3";
        a.released = "123123";
    }
    @After
    public void printBook()
    {
        System.out.println(a.toString());
    }
    @Test(timeout = 2000)
    public void testBook()
    {
        assertNotNull(a);
    }
}
