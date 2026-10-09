int temp; // temperature is used as a variable to store a value or more
int y; // y is used to display the position of the numbers on the y axis
int days; // days is used to store the numbers on the x axis
int x; // x is used to display the position of the numbers on the x axis
int[][] temperatures = {
{14, 16, 20, 21, 18}, // Day 1
{15, 13, 13, 11, 11},  // Day 2
{9, 11, 13, 15, 15}};  // Day 3
void setup()
{
  size(1200, 800); // width is 1200 and height is 800 
  textSize(12); // Size of text
  background(219, 169, 31); // Background color of orange
}

void draw()
{
  fill(255, 255, 255); // labels are colored white
  line(100, 80, 100, 600); // Vertical line (Y-Axis)
  text("Temperature", 5, 400); // Positioning of the y-axis label (Temperature)
  line(100, 600, 1010, 600); // Horizontal line (X-Axis)
  text("Time/Day", 525, 675); // Positioning of the x-axis label (Time/Day)
  text("TEMPERATURE WAVE", 500, 50); // Positioning of graph title
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
          100 + (rows + 1) * 45 + columns * 8,
          600 - temperatures[rows][columns] * 17,
          100 + (rows + 2) * 45,
          600 - temperatures[rows + 1][0] * 17
        );
      }
    }
  }
}

