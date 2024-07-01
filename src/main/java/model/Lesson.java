package model;

import java.sql.Timestamp;

public class Lesson {
    private int lessonId;
    private String creatorName;
    private String lessonTitle;
    private String lessonContentId;
    private int lessonFolderId;
    private String lessonQuizId;
    private String skill;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int version;
    private String status; // Thêm thuộc tính status

    public Lesson() {

    }

    public Lesson(String creatorName, String lessonTitle, String lessonContentId, int lessonFolderId, String lessonQuizId, String skill, Timestamp createdAt, Timestamp updatedAt, int version, String status) {
        this.creatorName = creatorName;
        this.lessonTitle = lessonTitle;
        this.lessonContentId = lessonContentId;
        this.lessonFolderId = lessonFolderId;
        this.lessonQuizId = lessonQuizId;
        this.skill = skill;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.version = version;
        this.status = status;
    }

    // Getters and setters
    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getLessonContentId() {
        return lessonContentId;
    }

    public void setLessonContentId(String contentId) {
        this.lessonContentId = contentId;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public void setVersion() {
        this.version = version + 1;
    }

    public int getVersion() {
        return version;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLessonTitle() {
        return lessonTitle;
    }

    public void setLessonTitle(String lessonTitle) {
        this.lessonTitle = lessonTitle;
    }

    public String getLessonQuizId() {
        return lessonQuizId;
    }

    public void setLessonQuizId(String lessonQuizId) {
        this.lessonQuizId = lessonQuizId;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public int getLessonFolderId() {
        return lessonFolderId;
    }

    public void setLessonFolderId(int lessonFolderId) {
        this.lessonFolderId = lessonFolderId;
    }
}
