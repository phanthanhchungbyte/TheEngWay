package servlets;

import dao.JdbcLessonDao;
import dao.LessonDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Lesson;
import model.User;
import org.apache.commons.io.IOUtils;

import java.io.*;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;

@WebServlet(name = "AddNewLessonServlet", value = "/actAddNewLesson")
@MultipartConfig
public class AddNewLessonServlet extends HttpServlet {
    @Override
    // Set to public for testing purpose
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a new lesson dao to add new lesson
        JdbcLessonDao lessonDao = new JdbcLessonDao();
        // Get the parameters from the sender
        Part titlePart = request.getPart("lesson-title");
        Part contentPart = request.getPart("lesson-content");
        Part lessonTypePart = request.getPart("lesson-type");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        InputStream titleStream = titlePart.getInputStream();
        String lessonTitle = IOUtils.toString(titleStream, StandardCharsets.UTF_8.name());

        InputStream contentStream = contentPart.getInputStream();
        String lessonContent = IOUtils.toString(contentStream, StandardCharsets.UTF_8.name());

        InputStream lessonTypeStream = lessonTypePart.getInputStream();
        String lessonType = IOUtils.toString(lessonTypeStream, StandardCharsets.UTF_8.name());

        // Try writing to a file locally, in src/main/java/lessons
        String appRootPath = getServletContext().getRealPath("/");
        appRootPath = appRootPath.replaceAll("\\\\target.+", "") + "\\src\\main\\lessons\\";
        String lessonPath = getLessonPath(appRootPath, lessonType);

        Path path = Paths.get(lessonPath);
        
        if(Files.exists(path)) {
            // Use OutputStreamWriter to write UTF-8 content, like Vietnamese content.
            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(path + "\\" + lessonTitle + ".txt"), StandardCharsets.UTF_8);
            writer.write(lessonContent);
            writer.close();

            // Add the lesson to the lesson dao
            lessonDao.createLesson(
                new Lesson(user.getUserName(), lessonTitle, lessonType)
            );
        }
    }

    public static String getLessonPath(String lessonRootPath, String lessonType) {
        String lessonPath = lessonRootPath;
        switch(lessonType) {
            case "Vocabulary":
                lessonPath += "VocabularySkill\\";
                break;
            case "Listening":
                lessonPath += "ListeningSkill\\";
                break;
            case "Pronunciation":
                lessonPath += "PronunciationSkill\\";
                break;
            case "Reading":
                lessonPath += "ReadingSkill\\";
                break;
            case "Writing":
                lessonPath += "WritingSkill\\";
                break;
            case "Grammar":
                lessonPath += "GrammarSkill\\";
                break;
        }
        return lessonPath;
    }
}