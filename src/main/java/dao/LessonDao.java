package dao;
import model.Lesson;

import java.util.ArrayList;

public interface LessonDao {
    boolean createLesson(Lesson lesson);
    ArrayList<Lesson> getAllLessonsByCreator(String creatorUsername);
//    boolean deleteLesson(String LessonId, String QuizId);
}