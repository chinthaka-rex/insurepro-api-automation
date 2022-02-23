package util;

import java.io.File;

public class DeleteFiles {
    public void deleteThisFiles(String delDirectory, String fileType) {
        String directory = delDirectory;

        File folder = new File(directory);
        File fList[] = folder.listFiles();

        for (File f : fList) {
            if (f.getName().endsWith(fileType)) {
                f.delete();
            }
        }
    }
}
