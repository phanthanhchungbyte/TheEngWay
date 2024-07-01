package model;

public class LessonFolder {
    private int lessonId;
    private String lessonFolderName;
    private String lessonFolderSkill;
    private String lessonFolderCreator;

    public LessonFolder(int lessonId, String lessonFolderName, String lessonFolderSkill, String lessonFolderCreator) {
        this.lessonId = lessonId;
        this.lessonFolderName = lessonFolderName;
        this.lessonFolderSkill = lessonFolderSkill;
        this.lessonFolderCreator = lessonFolderCreator;
    }

    public LessonFolder(String lessonFolderName, String lessonFolderSkill, String lessonFolderCreator) {
        this.lessonFolderName = lessonFolderName;
        this.lessonFolderSkill = lessonFolderSkill;
        this.lessonFolderCreator = lessonFolderCreator;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getLessonFolderName() {
        return lessonFolderName;
    }

    public void setLessonFolderName(String lessonFolderName) {
        this.lessonFolderName = lessonFolderName;
    }

    public String getLessonFolderSkill() {
        return lessonFolderSkill;
    }

    public void setLessonFolderSkill(String lessonFolderSkill) {
        this.lessonFolderSkill = lessonFolderSkill;
    }

    public String getLessonFolderCreator() {
        return lessonFolderCreator;
    }

    public void setLessonFolderCreator(String lessonFolderCreator) {
        this.lessonFolderCreator = lessonFolderCreator;
    }
}
