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

import java.time.Duration;
import java.util.logging.Logger;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class TestLoginPage {
    private WebDriver driver;

    @BeforeEach
    public void testGoogleSearch() {
        WebDriverManager.edgedriver().setup();
        driver = new EdgeDriver();
    }

    @Test
    public void testLogin() throws InterruptedException {
        // Open Edge
        driver.get("http://localhost:8080/demo/login");

        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));

        // Wait for the username box to be present
        WebElement loginBox = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("username")));
        loginBox.sendKeys("JohnDoe123");

        Thread.sleep(1000);

        // Wait for the password box to be present
        WebElement passwordBox = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("password")));
        passwordBox.sendKeys("JohnDoe123@");

        Thread.sleep(1000);

        // Wait for the login button to load
        WebElement loginButton = wait.until(ExpectedConditions.presenceOfElementLocated(By.name("login")));
        loginButton.click();

        // Verify the title
        String url = driver.getCurrentUrl();
        assertTrue(url.contains("teacherHome"));
    }

    @AfterEach
    public void tearDown() {
        // Close the browser
        if (driver != null)
            driver.quit();
    }
}
