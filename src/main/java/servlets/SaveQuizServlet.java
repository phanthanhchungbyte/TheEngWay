package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.UUID;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/SaveQuiz")
public class SaveQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(sb.toString(), JsonObject.class);
        String quizType = jsonObject.get("quizType").getAsString();
        String quizTitle = jsonObject.get("quizTitle").getAsString();
        String quizContent = jsonObject.get("quizContent").toString();

        String quizId = UUID.randomUUID().toString();
        String quizFilePath = getServletContext().getRealPath("/quiz/" + quizId + ".json");

        File quizFile = new File(quizFilePath);
        try (FileWriter fileWriter = new FileWriter(quizFile)) {
            fileWriter.write(jsonObject.toString());
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"success\": true, \"quizId\": \"" + quizId + "\"}");
    }
}
