
int day = 2;
int dtimer = 0;
int htimer;

City london = new City(0, 0);

// co-ordinate details solution: add in array to JSON file in python code
// i.e. automatically append max and min values

void setup()
{
  size(800, 600);
  
  london.load();
}

void draw() {

  htimer = frameCount*40%2400;

  // cycle day timer 
  if (htimer == 0) {
    if (dtimer == 6) {
      dtimer = 0;
    } else {
      dtimer ++;
    }
  }

  // draw time details
  fill(255);
  textSize(10);
  text( "day:  " + dtimer, 10, 15);
  text("hour:  " + htimer, 10, 30);


  london.display();
  london.line_chart();

  //  VIDEO MAKING //
  //if (frameCount == 450){
  //  exit();
  //};
  //if (frameCount%2 == 0){
  //  saveFrame("frames/####.png");
  //}
}





void line_chart(int [] array) {

  PVector [] points = new PVector[array.length];
  float interval = (width*.75) / array.length;
  float x = 0;
  float y = 600;
  fill(#6ffe86);

  // Load points into vector array
  for (int i=0; i<array.length; i++) {
    points[i] = new PVector(x, y-array[i]);
    //ellipse(x, y-array[i], 2, 2);
    //rect(x, y-array[i], (interval*.9), y);
    x = x+interval;
  }
  // draw line shape
  noFill();
  stroke(#6ffe86);
  beginShape();
  curveVertex(points[0].x, points[0].y);
  for (int i=0; i<array.length; i++) {
    curveVertex(points[i].x, points[i].y);
  }
  curveVertex(points[array.length-1].x, points[array.length-1].y);
  endShape();
}