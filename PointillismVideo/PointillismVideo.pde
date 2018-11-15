import processing.video.*;

Capture video;
//size of circles
int pointillize = 5;
//amount of circles drawn - how fast each new frame updates
int speed = 1000;
//opacity of circles
int opacity = 200;

void setup(){
  size(640, 480);
  video = new Capture(this,width,height); 
  video.start();

}

void captureEvent(Capture video) {
  video.read();
}

void draw(){
  loadPixels();
  for(int i=0;i<speed;i++){
    //getting a random pixel location
    int x = int(random(video.width));
    int y = int(random(video.height));
    int loc = x + y*video.width;
    
    //getting the color from that random pixel
    float r = red(video.pixels[loc]);
    float g = green(video.pixels[loc]);
    float b = blue(video.pixels[loc]);
    noStroke();
    
    fill(r,g,b, opacity);
    ellipse(x,y,pointillize, pointillize);
  }
 

}

void mouseClicked(){
  saveFrame("/output/capture####.jpg");
}
