import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;
import java.time.Duration;


public class TestRegisterPage {
    private WebDriver driver;
    private WebDriverWait wait;

    @BeforeEach
    public void setUp() {
        // Set up ChromeDriver using WebDriverManager
        WebDriverManager.edgedriver().setup();
        driver = new EdgeDriver();
        wait = new WebDriverWait(driver, Duration.ofSeconds(20));
    }

    @Test
    public void testUsernameTaken() throws InterruptedException {
        driver.get("http://localhost:8080/demo/register");

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("username"))).sendKeys("JohnDoe123");
        Thread.sleep(1000);

        WebElement usernameMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("username-new-message")));
        Thread.sleep(1000);

        assertEquals(usernameMsg.getText(), "Username is already taken");
    }

    @Test
    public void testEmailTaken() throws InterruptedException {
        driver.get("http://localhost:8080/demo/register");

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("email"))).sendKeys("holephuongnam.2004@gmail.com");
        Thread.sleep(1000);

        WebElement emailMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("email-new-message")));
        Thread.sleep(1000);

        assertEquals(emailMsg.getText(), "Email address is already taken");
    }

    @Test
    public void testMismatchedPassword() throws InterruptedException {
        driver.get("http://localhost:8080/demo/register");

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("password"))).sendKeys("Abcde@123");
        Thread.sleep(1000);

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("confirm-password"))).sendKeys("Abcde@124");
        Thread.sleep(1000);

        WebElement misPassMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("repassword-new-message")));
        Thread.sleep(1000);

        assertEquals(misPassMsg.getText(), "Passwords do not match");
    }

    @Test
    public void testIsEmpty() throws InterruptedException {
        driver.get("http://localhost:8080/demo/register");

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("username"))).sendKeys("");
        Thread.sleep(1000);

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("email"))).sendKeys("");
        Thread.sleep(1000);

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("password"))).sendKeys("");
        Thread.sleep(1000);

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("confirm-password"))).sendKeys("");
        Thread.sleep(1000);

        wait.until(ExpectedConditions.visibilityOfElementLocated(By.name("submit"))).click();
        Thread.sleep(1000);

        String isNullMsg;

        isNullMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("username-new-message"))).getText();
        Thread.sleep(1000);

        isNullMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("password-new-message"))).getText();
        Thread.sleep(1000);

        isNullMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("repassword-new-message"))).getText();
        Thread.sleep(1000);

        isNullMsg = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("email-new-message"))).getText();
        Thread.sleep(1000);

        assertEquals(isNullMsg, "Field must not be empty.");
    }

    @AfterEach
    public void tearDown() {
        // Close the browser
        if (driver != null) {
            driver.quit();
        }
    }

}


