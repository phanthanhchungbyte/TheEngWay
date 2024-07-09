package model;
import java.sql.Timestamp;

public class Comment {
    private int commentId;
    private int lessonId;
    private String userName;
    private String commentContent;
    private Timestamp commentCreatedDate;

    // Constructors, getters and setters
    public Comment() {}

    public Comment(int lessonid, String userName, String commentContent, Timestamp commentCreatedDate) {
        this.lessonId = lessonid;
        this.userName = userName;
        this.commentContent = commentContent;
        this.commentCreatedDate = commentCreatedDate;
    }

    public Comment(int commentId, int lessonId, String userName, String commentContent, Timestamp commentCreatedDate) {
        this.commentId = commentId;
        this.lessonId = lessonId;
        this.userName = userName;
        this.commentContent = commentContent;
        this.commentCreatedDate = commentCreatedDate;
    }

    public int getCommentId() { return commentId; }
    public void setCommentId(int commentId) { this.commentId = commentId; }

    public int getLessonId() { return lessonId; }
    public void setLessonId(int lessonId) { this.lessonId = lessonId; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getCommentContent() { return commentContent; }
    public void setCommentContent(String commentContent) { this.commentContent = commentContent; }

    public Timestamp getCommentCreatedDate() { return commentCreatedDate; }
    public void setCommentCreatedDate(Timestamp commentCreatedDate) { this.commentCreatedDate = commentCreatedDate; }
}
