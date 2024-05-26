package org.example.demo;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class test {
    public static void main(String[] args) {
        Path file = Paths.get("src/main/resources/resultlog.txt");
        List<String> list = new ArrayList<>();
        list.add("nigga");
        try {
            Files.write(file, list, StandardCharsets.UTF_8);
        } catch (IOException e) {
            System.out.println(e);
        }
    }
}
