

class City {

  JSONArray v;
  int [] totals = new int [100];
  PVector [] points = new PVector[totals.length];
  PImage backgroundImage;
  int total; // for running count of total venues

  float x, y;
  int w = 800;
  int h = 600;

  float latmax = 51.5533802;
  float latmin = 51.43581847;
  float lonmin = -0.25285721;
  float lonmax = -0.00600815;

  // load in starting location
  City(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void load() {

    // fetch array of venues
    JSONObject venues = loadJSONObject("data/venues_hours2.json");
    v = venues.getJSONArray("venues");

    // load background image
    backgroundImage = loadImage("background.jpg");
    backgroundImage.resize(w, h);

    // fill running totals array with zeroes
    for (int i=0; i<totals.length; i++) {
      totals[i] = 0;
    }
  }

  void display() {

    // draw background image
    image(backgroundImage, 0, 0);

    // reset total count
    total = 0;
    // cycle array
    array_shift(totals);

    // run through each venue in turn
    for (int i=0; i<v.size(); i++) {

      // Object - Venue
      JSONObject o = v.getJSONObject(i);

      // Object - Co-ordinates
      JSONObject coords = o.getJSONObject("coordinates");

      // Array - Hours for each day
      JSONArray hours = o.getJSONArray("hours");
      //println(hours.getJSONObject(0).getString("start"));

      // Define Lat and Lon
      float lat_in = coords.getFloat("latitude");
      float lon_in = coords.getFloat("longitude");

      float lat_out = map(lat_in, latmin, latmax, h, y);
      float lon_out = map(lon_in, lonmin, lonmax, x, w);

      // run through hours for each venue
      for (int j=0; j<hours.size(); j++) {

        JSONObject day_hours = hours.getJSONObject(j);
        int day = day_hours.getInt("day");
        int start = int(day_hours.getString("start"));
        int end = int(day_hours.getString("end"));


        if (day == dtimer) {
          if (htimer >= start && htimer <= end) {

            total ++;
            float s;
            float c;
            float maxRad = 40;
            int ldif = htimer - start;
            int rdif = end - htimer;

            // re-sizing conditions - grow up to middle of time and shrink for rest
            if (ldif <= rdif) {
              s = map(ldif, 0, 2400, 0, maxRad);
              c = map(ldif, 0, 2400, 30, 0);
            } else {
              s = map(rdif, 0, 2400, 0, maxRad);
              c = map(rdif, 0, 2400, 30, 0);
            }

            // draw 
            noStroke();
            
            colorMode(HSB);
            fill(c, 255, 255);
            ellipse(lon_out, lat_out, 6+s, 6+s);
            
            //fill(#6ffe86);
            //ellipse(lon_out, lat_out, 6+s, 6+s);
            //fill(#5ed671);
            //ellipse(lon_out, lat_out, 2+s, 2+s);
          }
        }
      }
    }
    // load latest total into array
    totals[totals.length-1] = total;
    // reset total count
    total = 0;
    //line_chart();
  }


  void line_chart() {
    
    float interval = ((width-x)*.75) / totals.length;
    float cX = x;
    float cY = y+h;
    fill(#6ffe86);

    // Load points into vector array
    for (int i=0; i<totals.length; i++) {
      points[i] = new PVector(cX, cY-totals[i]);
      //ellipse(x, y-array[i], 2, 2);
      //rect(x, y-array[i], (interval*.9), y);
      cX = cX+interval;
    }
    // draw line shape
    noFill();
    stroke(#6ffe86);
    beginShape();
    curveVertex(points[0].x, points[0].y);
    for (int i=0; i<totals.length; i++) {
      curveVertex(points[i].x, points[i].y);
    }
    curveVertex(points[totals.length-1].x, points[totals.length-1].y);
    endShape();
  }
}





void array_shift(int [] array) {

  for (int i=1; i<array.length; i++) {
    array[i-1] = array[i];
  }
}