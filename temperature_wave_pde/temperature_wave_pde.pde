int temp; // temperature is used as a variable to store a value or more
int y; // y is used to display the position of the numbers on the y axis
int days; // days is used to store the numbers on the x axis
int x; // x is used to display the position of the numbers on the x axis
int[][] temperatures = {
{14, 16, 20, 21, 18}, // Day 1
{15, 13, 13, 11, 11},  // Day 2
{9, 11, 13, 15, 15}, // Dau 3
{17, 18, 19, 18, 18}, // Day 4
{13, 14, 15, 15, 14}};  // Day 5

int[][] feelsLikeTemperatures = {
{14, 16, 22, 20, 18}, // Day 1
{13, 11, 9, 7, 8}, // Day 2
{6, 13, 13, 14, 12}, // Day 3
{13, 13, 14, 16, 14}, // Day 4
{12, 11, 14, 12, 10}}; // Day 5
void setup()
{
  size(1250, 800); // width is 1250 and height is 800 
  textSize(12); // Size of text
}

void draw()
{
  background(219, 169, 31); // Background color of orange
  stroke(255); // White lines for the axes
  strokeWeight(2); // Thickness of the lines is 2 to keep it smoother
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
      if (temperatures[rows][columns] < 10) // conditional statement to check if the temperature is less than 10
      {
        fill(31, 179, 222); // circle's color is light blue if temperature is lower than 10
      }
      else if (temperatures[rows][columns] < 15) // conditional statement to check if the temperature is less than 15
      {
        fill(134, 232, 82); // circle's color is green if mild weather (not too hot or cold)
      }
      else if (temperatures[rows][columns] < 20) // conditional statement to check if the temperature is less than 20
      {
        fill(246, 250, 35); // circle's color is yellow if temperature is less than 20 but higher than 15
      }
      else 
      {
        fill(234, 47, 14); // circle's color is red if temperature is more than 20 degrees
      }
      ellipse(100 + (rows + 1) * 45 + columns * 8, 600 - (temperatures[rows][columns] * 17), 10, 10); // sorts the positioning of each data point
      
      if (columns < temperatures[rows].length - 1) // condition used to connect all temperature points
      {
        stroke(255, 100, 50); // Orange-red line
        line(
          100 + (rows + 1) * 45 + columns * 8,
          600 - temperatures[rows][columns] * 17,
          100 + (rows + 1) * 45 + (columns + 1) * 8,
          600 - temperatures[rows][columns + 1] * 17
        );
      }
      
      if (columns == temperatures[rows].length - 1 && rows < temperatures.length - 1) // condition used to move from one day to another
      {
        line(
          100 + (rows + 1) * 45 + columns * 8, // Calculates the horizontal (X) pixel position. Starts at a base offset of 100 pixels. Shifts right (row) by 45 pixels and further shifts right (column) by 8 pixels.
          600 - temperatures[rows][columns] * 17, // Calculates the vertical (Y) pixel position. Higher temperatures are higher on the screen. Each degree of temperature is scaled by 17 pixels.
          100 + (rows + 2) * 45, // Horizontal position of the next data point. Moves the line forward to the next row and continues onto the next column.
          600 - temperatures[rows + 1][0] * 17 // Grabs the temperature value of the next column. Scales it by 17 and flips it relative to the 600 pixel baseline.
        );
      }
    }
  }
  
  for (int rows = 0; rows < feelsLikeTemperatures.length; rows = rows + 1) // an outer for loop to access each value from each row
  {
    for (int columns = 0; columns < feelsLikeTemperatures[rows].length; columns = columns + 1) // an inner for loop to access each value from each column
    {
      if (feelsLikeTemperatures[rows][columns] < 10) // conditional statement to check if the temperature is less than 10
      {
        fill(31, 179, 222); // circle's color is light blue if temperature is lower than 10
      }
      else if (feelsLikeTemperatures[rows][columns] < 15) // conditional statement to check if the temperature is less than 15
      {
        fill(134, 232, 82); // circle's color is green if mild weather (not too hot or cold)
      }
      else if (feelsLikeTemperatures[rows][columns] < 20) // conditional statement to check if the temperature is less than 20
      {
        fill(246, 250, 35); // circle's color is yellow if temperature is less than 20 but higher than 15
      }
      else 
      {
        fill(234, 47, 14); // circle's color is red if temperature is more than 20 degrees
      }
      ellipse(100 + (rows + 1) * 45 + columns * 8, 600 - (feelsLikeTemperatures[rows][columns] * 17), 10, 10); // sorts the positioning of each data point
      
      if (columns < feelsLikeTemperatures[rows].length - 1) // condition used to connect all temperature points
      {
        stroke(139, 92, 246); //Purple lines
        
        line(
          100 + (rows + 1) * 45 + columns * 8,
          600 - feelsLikeTemperatures[rows][columns] * 17,
          100 + (rows + 1) * 45 + (columns + 1) * 8,
          600 - feelsLikeTemperatures[rows][columns + 1] * 17
        );
      }
      
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
