package com.university.util;

import java.io.File;

public class DriveUpload {

    // ⚠️ अभी demo (real API बाद में connect होगा)
    public static String uploadFile(File file) {

        // यहाँ actual Google Drive API code आएगा
        // अभी test के लिए dummy link

        return "https://drive.google.com/file/d/" + file.getName();
    }
}