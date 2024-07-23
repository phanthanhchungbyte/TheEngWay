package servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.JdbcCommentDao;
import dao.JdbcLessonDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Comment;
import model.Lesson;

import java.io.*;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "LessonDetailServlet", value = "/actLessonDetail")
public class LessonDetailServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LessonDetailServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lessonId = request.getParameter("id");
        if (lessonId != null && !lessonId.isEmpty()) {
            JdbcLessonDao lessonDao = new JdbcLessonDao();
            Lesson lesson = lessonDao.getLessonById(Integer.parseInt(lessonId));
            request.setAttribute("lesson", lesson);
            System.out.println("Lesson Folder " + lesson.getSkill());
            System.out.println("Lesson Id " + lesson.getLessonId());

            // Get the file path from the folder and file name
            BufferedInputStream bufferIn = null;
            BufferedOutputStream bufferOut = null;

            String exactFilePath = getFilePath(lesson.getLessonTitle(), lesson.getSkill());

            // Begin finding the file and reading from it
            String lessonContent = readFromFile(exactFilePath);
            String lessonType = lesson.getSkill();
            lessonType = lessonType.toUpperCase(Locale.ENGLISH);

            request.setAttribute("lessonContent", lessonContent);
            request.setAttribute("lessonType", lessonType);
            request.setCharacterEncoding("UTF-8");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/lessonDetail");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/lessons");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws UnsupportedOperationException {
        // doPost is not supported here.
    }

    private String getFilePath(String fileName, String folderName) {
        String appRootPath = getServletContext().getRealPath("/");
        appRootPath = appRootPath.replaceAll("\\\\target.+", "") + "\\src\\main\\lessons\\";

        // Turn file extension to txt because file is a text file
        String exactLessonPath = AddNewLessonServlet.getLessonPath(appRootPath, folderName) + fileName + ".txt";
        return exactLessonPath;
    }

    private String readFromFile(String filePath) {
        StringBuilder fileContent = new StringBuilder();
        String line = "";
        try {
            File file = new File(filePath);
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));

            while((line = reader.readLine()) != null) {
                fileContent.append(line).append('\n');
            } // Read the file content
            reader.close();
            line = fileContent.toString().split("\n")[0];
            System.out.println("The first line is: " + line);
            System.out.println("FILE CONTENT IS AVAILABLE");
        } catch(IOException ioe) {
            Logger logger = Logger.getLogger(getClass().getName());
            logger.log(Level.SEVERE, ioe.getMessage(), ioe);
            logger.log(Level.SEVERE, "FILE NOT FOUND!");
        }

        return fileContent.toString();
    }
}