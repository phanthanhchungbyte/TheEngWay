package dao;

import java.util.ArrayList;

public interface LessonFolderDao {
    ArrayList<String> getLessonFoldersWSkill(String skill);

    int getLessonFolderId(String skill, String lessonFolderName);
}
