package com.Eanvan.async;

import javax.imageio.stream.FileImageOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

public class SaveImageTask implements Runnable {

    private byte[] bytes;
    private String path;
    private String fileName;


    /**
     * 保存图片的构造器
     *
     * @param bytes    要保存图片的字节数组
     * @param path     要保存的位置
     * @param fileName 保存的文件名
     */
    public SaveImageTask(byte[] bytes, String path, String fileName) {
        this.bytes = bytes;
        this.path = path;
        this.fileName = fileName;
    }

    @Override
    public void run() {
        if (bytes.length < 3 || path.equals("")) return;
        if (!checkPath()) return;
        /*FileOutputStream读取流的时候如果是文件夹，就会出错，无论怎么读，都拒绝访问，应该在读取的目录后面加上文件名！*/
        try (FileImageOutputStream fileImageOutputStream = new FileImageOutputStream(new File(path + fileName));) {
            fileImageOutputStream.write(bytes, 0, bytes.length);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private boolean checkPath() {
        File afile = new File(path);
        if (!afile.exists()) {
            return afile.mkdirs();
        }
        return true;
    }
}
