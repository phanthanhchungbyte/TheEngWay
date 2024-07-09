import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.tuckey.web.filters.urlrewrite.Conf;
import org.tuckey.web.filters.urlrewrite.RewrittenUrl;
import org.tuckey.web.filters.urlrewrite.UrlRewriter;
import org.tuckey.web.filters.urlrewrite.utils.Log;

import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class TestFilter {

    private static final Logger log = Logger.getLogger(TestFilter.class.getName());
    private static final String REWRITE_CONF = "urlrewrite.xml";

    private Conf conf;

    @BeforeEach
    public void setUp() {
        Log.setLevel("DEBUG");
        InputStream istream = getClass().getResourceAsStream("/" + REWRITE_CONF);
        conf = new Conf(istream, REWRITE_CONF);
    }

    @Test
    public void testRewriteStatusRedirect() throws Exception {
        String fromUrl = "/test/status/";
        String toUrl = "/rewrite-status";
        assertRewriteSuccess(fromUrl, toUrl, conf);
    }

    @Test
    public void testRewriteStatusForward() throws Exception {
        String fromUrl = "/rewrite-status";
        String toUrl = "/test/status/";
        assertRewriteSuccess(fromUrl, toUrl, conf);
    }

    @Test
    public void testSpecificJspsRedirect() throws Exception {
        String fromUrl = "/login";
        String toUrl = "/redirect?page=login";
        assertRewriteSuccess(fromUrl, toUrl, conf);
    }

    @Test
    public void testSkillForward() throws Exception {
        String fromUrl = "/skillReading";
        String toUrl = "/actLoadSkillLessons?skill=Reading";
        assertRewriteSuccess(fromUrl, toUrl, conf);
    }

    @Test
    public void testSkillWithIdForward() throws Exception {
        String fromUrl = "/skillWriting/123";
        String toUrl = "/actLoadAllLessons?skill=Writing&folderId=123";
        assertRewriteSuccess(fromUrl, toUrl, conf);
    }

    @Test
    public void testSkillWithIdAndNameForward() throws Exception {
        String fromUrl = "/skillReading/123/lesson1";
        String toUrl = "/actLoadAllLessons?skill=Reading&folderId=123&lessonName=lesson1";
        assertRewriteSuccess(fromUrl, toUrl, conf);
    }

    private void assertRewriteSuccess(String fromUrl, String toUrl, Conf conf) throws Exception {
        UrlRewriter rewriter = new UrlRewriter(conf);

        // Mock HttpServletRequest
        HttpServletRequest request = mock(HttpServletRequest.class);
        when(request.getRequestURI()).thenReturn(fromUrl);

        // Mock HttpServletResponse
        HttpServletResponse response = mock(HttpServletResponse.class);

        RewrittenUrl rewrittenUrl = rewriter.processRequest(request, response);
        assertNotNull(rewrittenUrl, "Could not rewrite URL from:" + fromUrl + " to:" + toUrl);
        String rewrittenUrlString = rewrittenUrl.getTarget();
        log.log(Level.FINE, "URL Rewrite from:[{0}] to [{1}]", new Object[]{fromUrl, rewrittenUrlString});
        assertEquals(toUrl, rewrittenUrlString, "Rewrite from:" + fromUrl + " to:" + toUrl + " did not succeed");
    }
}
