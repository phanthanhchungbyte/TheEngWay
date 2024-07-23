package utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;

public class ReadFromFileTest {
    public static void main(String[] args) {
        StringBuilder fileContent = new StringBuilder();
        String line = "";
        try {
            File file = new File("C:\\Users\\ACER\\Documents\\Zalo Received Files\\TheEngWayPush (22-6-24)\\TheEngWayPush (22-6-24)\\src\\main\\lessons\\VocabularySkill\\Từ Vựng Đồ dùng học tập.txt");
            BufferedReader reader = new BufferedReader(new FileReader(file));

            while((line = reader.readLine()) != null) {
                fileContent.append(line + "\n");
            } // Read the file content
            reader.close();
            line = fileContent.toString().split("\n")[0];
            System.out.println("The first line is: " + line);
            System.out.println("FILE CONTENT IS AVAILABLE");
        } catch(IOException ioe) {
            System.out.println(ioe.getMessage());
            System.out.println("FILE NOT FOUND!");
        }
    }
}
