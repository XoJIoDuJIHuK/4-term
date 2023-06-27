package staff;

import company.Company;
import org.junit.*;
import org.testng.annotations.BeforeSuite;
import staff.engineers.Engineer;
import staff.engineers.developers.Junior;

import java.io.*;
import java.util.Comparator;

import static java.lang.Double.parseDouble;

public class DirectorTest {

    static Company Yandex;

    @Before
    public void setUp() throws Exception {
        Yandex = new Company();
    }
    @After
    public void tearDown() throws Exception {
        Yandex = null;
    }
    @BeforeClass
    public static void initializeClass() throws FileNotFoundException {
        Yandex = new Company(0);
        try (BufferedReader br = new BufferedReader(new FileReader("src/staff/source.txt")))
        {
            //чтение построчно
            String s;
            while((s = br.readLine()) != null) {

                String[] arr = s.split(" ");
                Yandex.Add(new Junior(arr[0], parseDouble(arr[1])));
            }

            Yandex.PrintEngineers();
        }
        catch (IOException ex){

            System.out.println(ex.getMessage());
        }
    }
    @AfterClass
    public static void nullifyClass() {
        Yandex = null;
    }
    @BeforeSuite
    public void beforeSuite() {
        System.out.println("This method is called before running all test classes");
    }

    @Test
    @Ignore
    public void countEmployees() {
        int actual = Yandex.director.CountEmployees();
        int expected = Yandex.getEngineers().size();

        Assert.assertEquals(actual, expected);
    }

    @Test (timeout = 100)
    public void sort() throws Exception {
        //Thread.sleep(1000);
        Yandex.getEngineers().sort(new Comparator<Engineer>() {
            @Override
            public int compare(Engineer lhs, Engineer rhs) {
                // -1 - less than, 1 - greater than, 0 - equal, all inversed for descending
                return -Double.compare(rhs.salary, lhs.salary);
            }
        });
        var expected = Yandex.getEngineers();
        var actual = Yandex.director.Sort("salary");

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void printEngineersBySkill() {
        Skills skill = Skills.ADVANCED;
        var expected = Yandex.getEngineers().stream().filter(s -> s.skill == skill).toList();
        var actual = Yandex.director.PrintEngineersBySkill(skill);

        Assert.assertEquals(expected, actual);
    }
}