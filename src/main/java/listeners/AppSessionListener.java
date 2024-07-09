package listeners;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

import java.util.logging.Level;
import java.util.logging.Logger;

@WebListener
public class AppSessionListener implements HttpSessionListener {
    private static final Logger logger = Logger.getLogger(AppSessionListener.class.getName());

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        // Set the session attribute when a new session is created
        se.getSession().setAttribute("loggedInUser", null);
        se.getSession().setAttribute("loggedIn", "false");
        // Log session creation
        logger.log(Level.INFO, "Session created: " + se.getSession().getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // Log session destruction
        logger.log(Level.INFO, "Session destroyed: " + se.getSession().getId());
    }
}
