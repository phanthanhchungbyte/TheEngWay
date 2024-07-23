package dao;
import model.Lesson;

import java.util.ArrayList;

public interface LessonDao {
    boolean createLesson(Lesson lesson);
//    ArrayList<Lesson> getAllLessonsByCreator(String creatorUsername);
    ArrayList<Lesson> getAllLessonsWithFolder(String lessonSkill);
     ArrayList<Lesson> searchLessonsByTitle(String searchString);
//    String getLessonDataWithName(String lessonName);
//    ArrayList<Lesson> getDemoLessonsWithFolder(ArrayList<Integer> lessonFolderIds);
//    ArrayList<String> getLessonDataForFetch(String lessonName, int lessonFolderId);
//    int getLessonIdWithFolderAndName(int lessonFolderId, String lessonName);
    //    boolean deleteLesson(String LessonId, String QuizId);
}