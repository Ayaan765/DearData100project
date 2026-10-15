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
{10, 16, 19, 18, 16}}; // Day 9

int[][] feelsLikeTemperatures = {
{14, 16, 22, 20, 18}, // Day 1
{13, 11, 9, 7, 8}, // Day 2
{6, 13, 13, 14, 12}, // Day 3
{13, 13, 14, 16, 14}, // Day 4
{12, 11, 14, 12, 10}, // Day 5
{11, 15, 15, 16, 14}, // Day 6
{13, 12, 13, 14, 17}, // Day 7
{15, 17, 19, 17, 13}, // Day 8
{11, 16, 17, 17, 15}}; // Day 9

PImage weather; // variable to declare an image

import processing.sound.*;

// Names of all sound files
SoundFile wind;
SoundFile birds;
SoundFile nature;
SoundFile crickets;

// Variable to check if mouse was hovered over a temperature
boolean wasHovering = false;
int lastHoveredRow = -1;
int lastHoveredColumn = -1;

void setup()
{
  size(1250, 800); // width is 1250 and height is 800 
  textSize(12); // Size of text
  weather = loadImage("Weather-icon.png"); // Loads the image onto the screen
  wind = new SoundFile(this, "wind.mp3");
  birds = new SoundFile(this, "birdschirping.mp3");
  nature = new SoundFile(this, "nature-sounds.mp3");
  crickets = new SoundFile(this, "summercrickets.mp3");
}

void draw()
{
  background(219, 169, 31); // Background color of orange
  noStroke(); // Removes the outline from the filled shape
  fill(255, 100, 50, 150); // Transparent orange-red fill
  image(weather, 675, 10, 150, 50); // Size and positioning of image 
  
  beginShape();

  // Start at the bottom of the graph
  vertex(145, 600);

  // Follow every actual temperature reading
  for (int rows = 0; rows < temperatures.length; rows = rows + 1)
  {
  for (int columns = 0; columns < temperatures[rows].length; columns = columns + 1)
  {
    vertex(
      100 + (rows + 1) * 45 + columns * 8,
      600 - temperatures[rows][columns] * 17
    );
  }
  }

   // Return to the bottom at the final reading
   vertex(
      100 + temperatures.length * 45
      + (temperatures[temperatures.length - 1].length - 1) * 8,
      600
   );

  endShape(CLOSE);
  
  fill(132, 92, 246, 50); // color of mountain
  beginShape();

  // Start at the bottom of the graph
  vertex(145, 600);

  // Follow every actual temperature reading
  for (int rows = 0; rows < feelsLikeTemperatures.length; rows = rows + 1)
  {
  for (int columns = 0; columns < feelsLikeTemperatures[rows].length; columns = columns + 1)
  {
    vertex(
      100 + (rows + 1) * 45 + columns * 8,
      600 - feelsLikeTemperatures[rows][columns] * 17
    );
  }
  }

   // Return to the bottom at the final reading
   vertex(
      100 + feelsLikeTemperatures.length * 45
      + (feelsLikeTemperatures[feelsLikeTemperatures.length - 1].length - 1) * 8,
      600
   );

  endShape(CLOSE);
  
  stroke(255); // White lines for the axes
  fill(255, 255, 255); // labels are colored white
  line(100, 80, 100, 600); // Vertical line (Y-Axis)
  text("Temperature", 5, 400); // Positioning of the y-axis label (Temperature)
  line(100, 600, 1010, 600); // Horizontal line (X-Axis)
  text("Time/Day", 525, 675); // Positioning of the x-axis label (Time/Day)
  text("TEMPERATURE WAVE", 500, 50); // Positioning of graph title
  text("KEY", 1030, 150); // Positioning of the Keys title
  text("Orange-red line = Actual temperature", 1030, 180); // Positioning of the key ('Actual temperature') description of the orange-red line meaning
  text("Purple line = Feels-like temperature", 1030, 200); // Positioning of the key ('Feels like temperature') description of the purple line meaning
  text("Blue: below 10°C", 1030, 220); // Positioning of the key and text (Lower temperatures) presenting the color of blue
  text("Green: 10-14°C", 1030, 240); // Positioning of the key and text (Temperatures between 10-14) presenting the color of green
  text("Yellow: 15-19°C", 1030, 260); // Positioning of the key and text (Temperatures between 15-19) presenting the color of yellow
  text("Red: 20°C or above", 1030, 280); // Positioning of the key and text (Temperatures above or at 20) presenting the color of red
  
  y = 600; // initial value of y
  for (temp = 0; temp < 35; temp = temp + 5) // a for loop is used to display values on the y axis
  {
    text(temp, 85, y); // positioning of storing each value (0,5,10,15,20,25,30)
    y = y - 85; // spacing between the temperatures on the y axis
  }
  
  x = 100; // initial value of x
  for (days = 0; days < 21; days = days + 1) // a for loop is used to display values on the x axis
  {
    text(days, x, 625); // positioning of storing each value (0-20)
    x = x + 45; // spacing between the numbers on x axis
  }
  
  for (int rows = 0; rows < temperatures.length; rows = rows + 1) // an outer for loop to access each value from each row
  {
    for (int columns = 0; columns < temperatures[rows].length; columns = columns + 1) // an inner for loop to access each value from each column
    {
      stroke(60);
      strokeWeight(1.5);
      if (temperatures[rows][columns] < 10) // conditional statement to check if the temperature is less than 10
      {
        fill(31, 179, 222); // square's color is light blue if temperature is lower than 10
        square(
        100 + (rows + 1) * 45 + columns * 8 - 5,
        600 - temperatures[rows][columns] * 17 - 5,
        10);
        
      } 
      else if (temperatures[rows][columns] < 15) // conditional statement to check if the temperature is less than 15
      {
        fill(40, 170, 50); // triangle's color is green if mild weather (not too hot or cold)
        triangle(
        100 + (rows + 1) * 45 + columns * 8,
        600 - temperatures[rows][columns] *  17 - 7,
        
        100 + (rows + 1) * 45 + columns * 8 - 7,
        600 - temperatures[rows][columns] * 17 + 7,
        
        100 + (rows + 1) * 45 + columns * 8 + 7,
        600 - temperatures[rows][columns] * 17 + 7);
      }
      else if (temperatures[rows][columns] < 20) // conditional statement to check if the temperature is less than 20
      {
        fill(246, 250, 35); // circle's color is yellow if temperature is less than 20 but higher than 15
        ellipse(
        100 + (rows + 1) * 45 + columns * 8,
        600 - temperatures[rows][columns] * 17,
        10,
        10);
      }
      else 
      {
        fill(234, 47, 14); // circle's color is red if temperature is more than 20 degrees
        rect(
        100 + (rows + 1) * 45 + columns * 8 - 7,
        600 - (temperatures[rows][columns]) * 17 - 4,
        14,
        10);
      }
      
      // Check whether there is another temperature reading in the same day.
      // length - 1 gives the index of the last column (4 when there are 5 readings).
      if (columns < temperatures[rows].length - 1) 
      {
        stroke(255, 100, 50); // Orange-red line
        strokeWeight(2); // Orange-red line thickness is 2
        line(
          // Starting X: positions the current temperature point horizontally.
          // 100 = starting offset; 45 = spacing for each day; 8 = spacing for each reading.
          100 + (rows + 1) * 45 + columns * 8,
          
          // Starting Y: converts the current temperature into a screen position.
          // 600 = vertical baseline; 17 = pixels used for each degree.
          600 - temperatures[rows][columns] * 17,
          
          // Ending X: calculates the horizontal position of the NEXT reading.
          // columns + 1 moves to the next column within the same day.
          100 + (rows + 1) * 45 + (columns + 1) * 8,
          
          // Ending Y: uses the temperature in the next column as the line's endpoint.
          600 - temperatures[rows][columns + 1] * 17
        );
      }
      // Check whether we're at the last reading of the current day
      // AND whether another day exists after the current day.
      // && means BOTH conditions must be true.
      if (columns == temperatures[rows].length - 1 && rows < temperatures.length - 1) // condition used to move from one day to another
      {
        line(
          100 + (rows + 1) * 45 + columns * 8, // Starting X: horizontal position of the current day's last reading.
          600 - temperatures[rows][columns] * 17, // Starting Y: vertical position of the current day's last temperature.
          100 + (rows + 2) * 45, // Ending X: horizontal position for the first reading of the next day.
                                 // rows + 2 moves the position forward to the next day.
          600 - temperatures[rows + 1][0] * 17 // Ending Y: vertical position of the next day's first temperature.
                                               // rows + 1 selects the next row; [0] selects its first reading.
        );
      }
    }
  }
  
  for (int rows = 0; rows < feelsLikeTemperatures.length; rows = rows + 1) // an outer for loop to access each value from each row
  {
    for (int columns = 0; columns < feelsLikeTemperatures[rows].length; columns = columns + 1) // an inner for loop to access each value from each column
    {
      stroke(60);
      strokeWeight(1.5);
      if (feelsLikeTemperatures[rows][columns] < 10) // conditional statement to check if the temperature is less than 10
      {
        fill(31, 179, 222); // square's color is light blue if temperature is lower than 10
        square(
           100 + (rows + 1) * 45 + columns * 8 - 5,
           600 - feelsLikeTemperatures[rows][columns] * 17 - 5,
           10
        );
      }
      else if (feelsLikeTemperatures[rows][columns] < 15) // conditional statement to check if the temperature is less than 15
      {
        fill(21, 232, 22); // circle's color is green if mild weather (not too hot or cold)
        triangle(
          100 + (rows + 1) * 45 + columns * 8,
          600 - feelsLikeTemperatures[rows][columns] * 17 - 7,

          100 + (rows + 1) * 45 + columns * 8 - 7,
          600 - feelsLikeTemperatures[rows][columns] * 17 + 7,

          100 + (rows + 1) * 45 + columns * 8 + 7,
          600 - feelsLikeTemperatures[rows][columns] * 17 + 7
        );
        
      }
      else if (feelsLikeTemperatures[rows][columns] < 20) // conditional statement to check if the temperature is less than 20
      {
        fill(246, 250, 35); // circle's color is yellow if temperature is less than 20 but higher than 15
        ellipse(100 + (rows + 1) * 45 + columns * 8, 600 - (feelsLikeTemperatures[rows][columns] * 17), 10, 10);
      }
      else 
      {
        fill(234, 47, 14); // sun's color is red if temperature is more than 20 degrees 
        rect(
           100 + (rows + 1) * 45 + columns * 8 - 7,
           600 - feelsLikeTemperatures[rows][columns] * 17 - 4,
           14,
           8
         ); // sorts the positioning of each data point
        
      }
      
      if (columns < feelsLikeTemperatures[rows].length - 1) // condition used to connect all temperature points
      {
        stroke(139, 92, 246); //Purple lines
        strokeWeight(3); // Thickness of purple line is 3
        line(
          // Starting X: horizontal position of the current reading. 
          // 100 = Starting offset, 45 = spacing between days,
          // 8 = spacing between readings within the day. 
          100 + (rows + 1) * 45 + columns * 8, 
          
          // Starting Y: vertical position of the current feels-like temperature
          // 600 = baseline of the graph; 17 = pixels per degree. 
          600 - feelsLikeTemperatures[rows][columns] * 17,
          
          // Ending X: horizontal position of the NEXT reading
          // columns + 1 selects the next reading within the same day
          100 + (rows + 1) * 45 + (columns + 1) * 8,
          
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
        line(
          100 + (rows + 1) * 45 + columns * 8, // Calculates the horizontal (X) pixel position. Starts at a base offset of 100 pixels. Shifts right (row) by 45 pixels and further shifts right (column) by 8 pixels.
          600 - feelsLikeTemperatures[rows][columns] * 17, // Calculates the vertical (Y) pixel position. Higher temperatures are higher on the screen. Each degree of temperature is scaled by 17 pixels.
          100 + (rows + 2) * 45, // Horizontal position of the next data point. Moves the line forward to the next row and continues onto the next column.
          600 - feelsLikeTemperatures[rows + 1][0] * 17 // Grabs the temperature value of the next column. Scales it by 17 and flips it relative to the 600 pixel baseline.
        );
      }
    }
  }
}

void mouseClicked()
{
  // Play a sound when the mouse is clicked on a temperature point.
  for (int rows = 0; rows < temperatures.length; rows++)
  {
    for (int columns = 0; columns < temperatures[rows].length; columns++)
    {
      float pointX = 100 + (rows + 1) * 45 + columns * 8;
      float pointY = 600 - temperatures[rows][columns] * 17;

      if (dist(mouseX, mouseY, pointX, pointY) < 10)
      {
        if (temperatures[rows][columns] < 10)
        {
          wind.play();
        }
        else if (temperatures[rows][columns] < 15)
        {
          birds.play();
        }
        else if (temperatures[rows][columns] < 20)
        {
          nature.play();
        }
        else
        {
          crickets.play();
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
      float pointX = 100 + (rows + 1) * 45 + columns * 8;
      float pointY = 600 - feelsLikeTemperatures[rows][columns] * 17;

      if (dist(mouseX, mouseY, pointX, pointY) < 10)
      {
        if (feelsLikeTemperatures[rows][columns] < 10)
        {
          wind.play();
        }
        else if (feelsLikeTemperatures[rows][columns] < 15)
        {
          birds.play();
        }
        else if (feelsLikeTemperatures[rows][columns] < 20)
        {
          nature.play();
        }
        else
        {
          crickets.play();
        }

        return;
      }
    }
  }
}
