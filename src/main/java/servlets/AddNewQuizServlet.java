package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectWriter;

@WebServlet(name = "AddNewQuizServlet", value = "/actAddNewQuiz")
public class AddNewQuizServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* TODO: To read the body of the request sent by fetch API in Javascript, use getReader() method of the request obj.
        *  TODO: We will read the question data this way.
        * */
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line = "";
        String[] quizData = new String[3];

        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        /*
        quizData[0] <=> quizDataObj
        quizData[1] <=> quizType
        quizData[2] <=> fileName
        * */
        String quizResult = sb.toString();
        if(quizResult.length() > 0) {
            System.out.println("Quiz data is not null!");
            System.out.println(quizResult);
        } else {
            System.out.println("Quiz data is empty!");
        }

        ObjectMapper mapper = new ObjectMapper();


        Map<String, String> quizDataMap = mapper.readValue(quizResult, new TypeReference<Map<String, String>>(){});

        // Chaining method calls to convert the map into a String array of values
        quizData = quizDataMap.values().stream().toArray(String[]::new);

        // Prettifying the JSON using built-in method
        Object json = mapper.readValue(quizData[0], Object.class);
        ObjectWriter objWriter = mapper.writerWithDefaultPrettyPrinter();
        quizData[0] = objWriter.writeValueAsString(json);

        // Try to get the root part of the quiz.
        String appRootPath = getServletContext().getRealPath("/");
        appRootPath = appRootPath.replaceAll("\\\\target.+", "") + "\\src\\main\\quiz\\";
        String lessonPath = getQuizPath(appRootPath, quizData[1] );

        Path path = Paths.get(lessonPath);

        if(Files.exists(path)) {
            // Use OutputStreamWriter to write UTF-8 content, like Vietnamese content.
            OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(path + "\\" + quizData[2] + ".json") , StandardCharsets.UTF_8);
            writer.write(quizData[0]);
            writer.close();
        }
    }

    // Get the path based on the quiz type.
    public static String getQuizPath(String quizRootPath, String quizType) {
        String quizPath = quizRootPath;
        switch(quizType) {
            case "MultipleChoice":
                quizPath += "ClozeQuizzes\\";
                break;
            case "Matching":
                quizPath += "MatchingQuizzes\\";
                break;
            case "Cloze":
                quizPath += "Multiple_ChoiceQuizzes\\";
                break;
        }
        return quizPath;
    }
}