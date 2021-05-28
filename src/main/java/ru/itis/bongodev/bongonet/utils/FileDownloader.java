package ru.itis.bongodev.bongonet.utils;

import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Objects;

@Component
@NoArgsConstructor
public class FileDownloader {
    public void download(MultipartFile file, String folderName, String fileName) {
        try {
            if (!file.isEmpty() && !Objects.requireNonNull(file.getOriginalFilename()).isEmpty()) {
                File uploadDirectory = new File(folderName);

                if (!uploadDirectory.exists()) {
                    uploadDirectory.mkdir();
                }

                System.out.println(folderName + "/" + fileName);
                file.transferTo(new File(folderName + "/" + fileName));
            }
        } catch (IOException e) {
            throw new IllegalStateException(e);
        }
    }
}
