import java.awt.image.BufferedImage;
import java.awt.image.DataBuffer;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;

class image {
 /* static int product(int x, int y) {
   return x * y;
  }
*/  
  // This API will compare two image file //
//return true if both image files are equal else return false//**
public static boolean compareImage(String source, String target) {        
   try {
	   
	   File file = new File(source);
	   File file1 = new File(target);

       // take buffer data from botm image files //
       BufferedImage biA = ImageIO.read(file);
       DataBuffer dbA = biA.getData().getDataBuffer();
       int sizeA = dbA.getSize();                      
       BufferedImage biB = ImageIO.read(file1);
       DataBuffer dbB = biB.getData().getDataBuffer();
       int sizeB = dbB.getSize();
       // compare data-buffer objects //
       System.out.println("check-size--1");

       if(sizeA == sizeB) {
           for(int i=0; i<sizeA; i++) { 
               if(dbA.getElem(i) != dbB.getElem(i)) {
                   return false;
               }
           }
           System.out.println("sucess--1");

           return true;
           
           
       }
       else {
           System.out.println("Falied--1");

           return false;
       }
   } 
   catch (Exception e) { 
       System.out.println("Failed to compare image files ...");
       return  false;
   }
}
  
  public static void main(String[] args) {
	  	  
      String source = "F:\\error-1.png";    
      String target ="F:\\error-2.png";
      
      boolean passwordcheck=compareImage(source,target);
      //compareImage();
      
  // image.compareImage(source, target);
   System.out.println("ss");
  }


}