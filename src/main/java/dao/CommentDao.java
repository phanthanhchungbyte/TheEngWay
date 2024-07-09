package dao;

import model.Comment;
import java.sql.*;
import java.util.ArrayList;

//Author : DiepDT
public interface CommentDao {
    void insertComment(Comment comment);
    ArrayList<Comment> getCommentsWithLesson(int lessonFolder, String lessonName);
}
