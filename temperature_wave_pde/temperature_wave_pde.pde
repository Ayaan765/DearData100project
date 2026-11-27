int temp; // temperature is used as a variable to store a value or more
int y; // y is used to display the position of the numbers on the y axis
int days; // days is used to store the numbers on the x axis
int x; // x is used to display the position of the numbers on the x axis

int[][] temperatures = {
  {14, 16, 20, 21, 18}, // Day 1
  {15, 13, 13, 11, 11}, // Day 2
  {9, 11, 13, 15, 15}, // Day 3
  {17, 18, 19, 18, 18}, // Day 4
  {13, 14, 15, 15, 14}, // Day 5
  {12, 15, 16, 15, 14}, // Day 6
  {13, 15, 16, 17, 17}, // Day 7
  {19, 19, 20, 19, 17}, // Day 8
  {10, 16, 19, 18, 16}, // Day 9
  {18, 20, 20, 21, 19}, // Day 10
  {14, 12, 15, 15, 12}, // Day 11
  {8, 13, 14, 14, 11}, // Day 12
  {8, 11, 14, 14, 12}, // Day 13
  {10, 13, 14, 14, 12}, // Day 14
  {13, 13, 13, 12, 12}, // Day 15
  {11, 10, 10, 10, 10}, // Day 16
  {12, 14, 15, 14, 13}, // Day 17
  {12, 12, 13, 12, 10}, // Day 18
  {11, 12, 12, 13, 15}, // Day 19 
  {13, 14, 13, 11, 10}}; // Day 20
  
int[][] feelsLikeTemperatures = {
  {14, 16, 22, 20, 18}, // Day 1
  {13, 11, 9, 7, 8}, // Day 2
  {6, 13, 13, 14, 12}, // Day 3
  {13, 13, 14, 16, 14}, // Day 4
  {12, 11, 14, 12, 10}, // Day 5
  {11, 15, 15, 16, 14}, // Day 6
  {13, 12, 13, 14, 17}, // Day 7
  {15, 17, 19, 17, 13}, // Day 8
  {11, 16, 17, 17, 15}, // Day 9
  {16, 17, 17, 19, 18}, // Day 10
  {12, 11, 14, 13, 10}, // Day 11
  {9, 12, 11, 10, 10}, // Day 12
  {6, 11, 11, 9, 8}, // Day 13
  {12, 13, 11, 12, 12}, // Day 14
  {9, 9, 10, 12, 13}, // Day 15
  {4, 5, 6, 7, 4}, // Day 16
  {10, 11, 12, 13, 12}, // Day 17
  {9, 11, 10, 5, 2}, // Day 18
  {9, 9, 6, 9, 11}, // Day 19
  {8, 8, 7, 5, 7}}; // Day 20

PImage weather; // variable to declare an image

import processing.sound.*;

// Names of all sound files
SoundFile wind;
SoundFile rain;
SoundFile cloudy;
SoundFile hot;

// Variable to check if mouse was hovered over a temperature
boolean wasHovering = false;
int lastHoveredRow = -1;
int lastHoveredColumn = -1;

void setup()
{
  size(1300, 900); // width is 1300 and height is 900
  textSize(12); // Size of text
  weather = loadImage("Weather-icon.png"); // Loads the image onto the screen
  wind = new SoundFile(this, "wind.mp3");
  rain = new SoundFile(this, "rain.mp3");
  cloudy = new SoundFile(this, "cloudy.mp3");
  hot = new SoundFile(this, "hot.mp3");
}

void draw()
{
  background(35, 22, 52); // Deep dusk-purple background
  noStroke(); // Removes the outline from the filled shape
  
  // Draw a soft glow behind the sun
  fill(235, 255, 10, 45); 
  ellipse(1100, 70, 100, 100);
  
  // Draw the sun itself 
  fill(235, 255, 10, 180); 
  noStroke(); // Removes the outline from the filled shape
  fill(255, 112, 82, 180); // Warm coral sunset wave
  image(weather, 675, 20, 150, 50); // Size and positioning of image
  
  beginShape(); // Creates the mountainous waves

  // Start at the bottom of the graph
  vertex(100, 600);

  // Follow every actual temperature reading
  for (int rows = 0; rows < temperatures.length; rows = rows + 1)
  {
    for (int columns = 0; columns < temperatures[rows].length; columns = columns + 1)
    {
      vertex(
        55 + (rows + 1) * 45 + columns * 8,
        600 - temperatures[rows][columns] * 17
      );
    }
  }

  // Return to the bottom at the final reading
  vertex(
    55 + temperatures.length * 45
    + (temperatures[temperatures.length - 1].length - 1) * 8,
    600
  );

  endShape(CLOSE);

  fill(164, 116, 255, 100); // color of purple mountain
  beginShape();

  // Start at the bottom of the graph
  vertex(100, 600);

  // Follow every actual temperature reading
  for (int rows = 0; rows < feelsLikeTemperatures.length; rows = rows + 1)
  {
    for (int columns = 0; columns < feelsLikeTemperatures[rows].length; columns = columns + 1)
    {
      vertex(
        55 + (rows + 1) * 45 + columns * 8,
        600 - feelsLikeTemperatures[rows][columns] * 17
      );
    }
  }

  // Return to the bottom at the final reading
  vertex(
    55 + feelsLikeTemperatures.length * 45
    + (feelsLikeTemperatures[feelsLikeTemperatures.length - 1].length - 1) * 8,
    600
  );

  endShape(CLOSE);

  stroke(255); // White lines for the axes
  fill(255, 205, 160); // labels are colored sunset-peached
  line(100, 80, 100, 600); // Vertical line (Y-Axis)
  text("Temperature", 36, 400); // Positioning of the y-axis label (Temperature)
  line(100, 600, 1060, 600); // Horizontal line (X-Axis)
  text("Day", 525, 675); // Positioning of the x-axis label (Day)
  textSize(25);
  fill(255, 205, 160); // Soft sunset-peach text
  text("TEMPERATURE WAVE", 400, 55); // Positioning of the text 
  textSize(12); // Restore the normal size for labels
  fill(255, 205, 160);
  
  // Creating the weather key 
  // Weather key background
  noStroke();
  fill(50, 35, 70);
  rect(1080, 140, 210, 240, 15);

  // Weather key heading
  fill(255, 205, 160);
  textSize(20);
  textAlign(LEFT);
  text("WEATHER KEY", 1095, 170);

  // Actual temperature
  stroke(255, 100, 50);
  strokeWeight(4);
  line(1095, 195, 1125, 195);

  noStroke();
  fill(255);
  textSize(13);
  text("Actual temperature", 1135, 200);

  // Feels-like temperature
  stroke(139, 92, 246);
  strokeWeight(4);
  line(1095, 225, 1125, 225);

  noStroke();
  fill(255);
  text("Feels-like temperature", 1135, 230);

  // Temperature ranges
  fill(255, 205, 160);
  textSize(15);
  text("Temperature ranges", 1095, 265);

  // Blue - Square
  fill(57, 155, 255);
  rectMode(CENTER);
  square(1105, 290, 10);
  fill(255);
  textSize(12);
  text("Below 10°C", 1125, 294);

  // Green - Triangle
  fill(53, 201, 121);
  triangle(1105, 309, 1099, 319, 1111, 319);
  fill(255);
  text("10-14°C", 1125, 319);

  // Yellow - Circle
  fill(245, 213, 71);
  ellipse(1105, 340, 10, 10);
  fill(255);
  text("15-19°C", 1125, 344);

  // Red - Rectangle
  fill(255, 81, 72);
  rect(1105, 365, 10, 10);
  fill(255);
  text("20°C or above", 1125, 369);
  
  rectMode(CORNER);

  y = 600; // initial value of y
  for (temp = 0; temp < 35; temp = temp + 5) // a for loop is used to display values on the y axis
  {
    text(temp, 85, y); // positioning of storing each value (0,5,10,15,20,25,30)
    y = y - 85; // spacing between the temperatures on the y axis
  }

  x = 55; // initial value of x
  for (days = 1; days <= 20; days = days + 1) // a for loop is used to display values on the x axis
  {
    text(days, 55 + days * 45, 625); // positioning of storing each value (0-20)
    x = x + 45; // spacing between the numbers on x axis
  }

  // Display actual temperature points using TemperaturePoint objects
  for (int rows = 0; rows < temperatures.length; rows = rows + 1) // an outer for loop to access each value from each row
  {
    for (int columns = 0; columns < temperatures[rows].length; columns = columns + 1) // an inner for loop to access each value from each column
    {
      TemperaturePoint point = new TemperaturePoint(
        temperatures[rows][columns],
        55 + (rows + 1) * 45 + columns * 8,
        600 - temperatures[rows][columns] * 17,
        false
      );

      point.display();

      // Check whether there is another temperature reading in the same day.
      // length - 1 gives the index of the last column (4 when there are 5 readings).
      if (columns < temperatures[rows].length - 1)
      {
        stroke(255, 100, 50); // Orange-red line
        strokeWeight(2); // Orange-red line thickness is 2
        line(
          // Starting X: positions the current temperature point horizontally.
          // 55 = starting offset; 45 = spacing for each day; 8 = spacing for each reading.
          55 + (rows + 1) * 45 + columns * 8,

          // Starting Y: converts the current temperature into a screen position.
          // 600 = vertical baseline; 17 = pixels used for each degree.
          600 - temperatures[rows][columns] * 17,

          // Ending X: calculates the horizontal position of the NEXT reading.
          // columns + 1 moves to the next column within the same day.
          55 + (rows + 1) * 45 + (columns + 1) * 8,

          // Ending Y: uses the temperature in the next column as the line's endpoint.
          600 - temperatures[rows][columns + 1] * 17
        );
      }

      // Check whether we're at the last reading of the current day
      // AND whether another day exists after the current day.
      // && means BOTH conditions must be true.
      if (columns == temperatures[rows].length - 1 && rows < temperatures.length - 1) // condition used to move from one day to another
      {
        stroke(255, 100, 50); // Orange-red line
        strokeWeight(2);
        line(
          55 + (rows + 1) * 45 + columns * 8, // Starting X: horizontal position of the current day's last reading.
          600 - temperatures[rows][columns] * 17, // Starting Y: vertical position of the current day's last temperature.
          55 + (rows + 2) * 45, // Ending X: horizontal position for the first reading of the next day.
          // rows + 2 moves the position forward to the next day.
          600 - temperatures[rows + 1][0] * 17 // Ending Y: vertical position of the next day's first temperature.
          // rows + 1 selects the next row; [0] selects its first reading.
        );
      }
    }
  }

  // Display feels-like temperature points using TemperaturePoint objects
  for (int rows = 0; rows < feelsLikeTemperatures.length; rows = rows + 1) // an outer for loop to access each value from each row
  {
    for (int columns = 0; columns < feelsLikeTemperatures[rows].length; columns = columns + 1) // an inner for loop to access each value from each column
    {
      TemperaturePoint point = new TemperaturePoint(
        feelsLikeTemperatures[rows][columns],
        55 + (rows + 1) * 45 + columns * 8,
        600 - feelsLikeTemperatures[rows][columns] * 17,
        true
      );

      point.display();

      if (columns < feelsLikeTemperatures[rows].length - 1) // condition used to connect all temperature points
      {
        stroke(139, 92, 246); // Purple line
        strokeWeight(3);  // Purple line thickness
        line(
          // Starting X: horizontal position of the current reading.
          // 100 = Starting offset, 45 = spacing between days,
          // 8 = spacing between readings within the day.
          55 + (rows + 1) * 45 + columns * 8,

          // Starting Y: vertical position of the current feels-like temperature
          // 600 = baseline of the graph; 17 = pixels per degree.
          600 - feelsLikeTemperatures[rows][columns] * 17,

          // Ending X: horizontal position of the NEXT reading
          // columns + 1 selects the next reading within the same day
          55 + (rows + 1) * 45 + (columns + 1) * 8,

          // Ending Y: vertical position of the next feels-like temperature.
          // [rows][columns + 1] accesses the next reading in the same day.
          600 - feelsLikeTemperatures[rows][columns + 1] * 17
        );
      }

      // Check whether we're at the last reading of the current day
      // AND whether another day exists after the current day.
      // && means BOTH conditions must be true.
      if (columns == feelsLikeTemperatures[rows].length - 1 && rows < feelsLikeTemperatures.length - 1) // condition used to move from one day to another
      {
        stroke(139, 92, 246); // Purple line
        strokeWeight(3);
        line(
          55 + (rows + 1) * 45 + columns * 8, // Calculates the horizontal (X) pixel position. Starts at a base offset of 100 pixels. Shifts right (row) by 45 pixels and further shifts right (column) by 8 pixels.
          600 - feelsLikeTemperatures[rows][columns] * 17, // Calculates the vertical (Y) pixel position. Higher temperatures are higher on the screen. Each degree of temperature is scaled by 17 pixels.
          55 + (rows + 2) * 45, // Horizontal position of the next data point. Moves the line forward to the next row and continues onto the next column.
          600 - feelsLikeTemperatures[rows + 1][0] * 17 // Grabs the temperature value of the next column. Scales it by 17 and flips it relative to the 600 pixel baseline.
        );
      }
    }
  }
  
  // Detect when the mouse hovers over a certain temperature point
  for (int rows = 0; rows < temperatures.length; rows++) {
    for (int columns = 0; columns < temperatures[rows].length; columns++) {
      float pointX = 55 + (rows + 1) * 45 + columns * 8;
      float pointY = 600 - temperatures[rows][columns] * 17;
      
      // Display the data of the temperature point hovered by the mouse, along with the size and color of text
      if (dist(mouseX, mouseY, pointX, pointY) < 10) {
        fill(255); // Colour of the text
        textSize(16); // Size of the text
        
        // Each temperature point will show the day and actual temperature of it in the left of the sketch
        textAlign(LEFT);
        
        text("Temperature", 36, 400);
        text("Day", 525, 675);
        
        text("Day: " + (rows + 1), 600, 300);
        text("Actual Temperature: " + temperatures[rows][columns] + "°C",
             600, 320);
      }
    }
  }
  
  // Detect when a mouse hovers over a certain temperature point
  for (int rows = 0; rows < feelsLikeTemperatures.length; rows++) {
    for (int columns = 0; columns < feelsLikeTemperatures[rows].length; columns++) {
      float pointX = 55 + (rows + 1) * 45 + columns * 8;
      float pointY = 600 - feelsLikeTemperatures[rows][columns] * 17;
      
      // Display the data of the temperature point hovered by the mouse, along with the size and color of the text
      if (dist(mouseX, mouseY, pointX, pointY) < 10) {
        fill(255); // Color of the text
        textSize(16); // Size of the text
        
        // Each temperature point will show the day and their feels like temperature
        text("Day: " + (rows + 1), 600, 220);
        text("Feels like Temperature: " + feelsLikeTemperatures[rows][columns] + "°C", 
             600, 200);
      }
    }
  }
}

// Function used to prevent sounds from overlapping
void stopAllSounds()
{
  wind.stop();
  rain.stop();
  cloudy.stop();
  hot.stop();
}

void mouseClicked()
{
  // Play a sound when the mouse is clicked on an actual temperature point.
  for (int rows = 0; rows < temperatures.length; rows++)
  {
    for (int columns = 0; columns < temperatures[rows].length; columns++)
    {
      float pointX = 55 + (rows + 1) * 45 + columns * 8;
      float pointY = 600 - temperatures[rows][columns] * 17;

      if (dist(mouseX, mouseY, pointX, pointY) < 10)
      {
        stopAllSounds();

        if (temperatures[rows][columns] < 10)
        {
          wind.play();
        }
        else if (temperatures[rows][columns] < 15)
        {
          rain.play();
        }
        else if (temperatures[rows][columns] < 20)
        {
          cloudy.play();
        }
        else
        {
          hot.play();
        }

        return;
      }
    }
  }

  // Play a sound when the mouse is clicked on a feelsLiketemperature point.
  for (int rows = 0; rows < feelsLikeTemperatures.length; rows++)
  {
    for (int columns = 0; columns < feelsLikeTemperatures[rows].length; columns++)
    {
      float pointX = 55 + (rows + 1) * 45 + columns * 8;
      float pointY = 600 - feelsLikeTemperatures[rows][columns] * 17;

      if (dist(mouseX, mouseY, pointX, pointY) < 10)
      {
        stopAllSounds();

        if (feelsLikeTemperatures[rows][columns] < 10)
        {
          wind.play();
        }
        else if (feelsLikeTemperatures[rows][columns] < 15)
        {
          rain.play();
        }
        else if (feelsLikeTemperatures[rows][columns] < 20)
        {
          cloudy.play();
        }
        else
        {
          hot.play();
        }

        return;
      }
    }
  }
}
