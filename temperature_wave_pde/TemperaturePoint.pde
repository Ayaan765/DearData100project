// Class used to store and display each temperature data point
class TemperaturePoint
{
  int temperature;
  float x;
  float y;
  boolean feelsLike;

  // Constructor stores the temperature and position of each data point.
  TemperaturePoint(int temperature, float x, float y, boolean feelsLike)
  {
    this.temperature = temperature;
    this.x = x;
    this.y = y;
    this.feelsLike = feelsLike;
  }

  // Function used to display each temperature point
  void display()
  {
    stroke(255, 230, 210); // Soft peach outline to match the sunset theme
    strokeWeight(1.5);

    if (temperature < 10) // conditional statement to check if the temperature is less than 10
    {
      fill(31, 179, 222); // square's color is light blue if temperature is lower than 10
      square(x - 5, y - 5, 10);
    }
    else if (temperature < 15) // conditional statement to check if the temperature is less than 15
    {
      if (feelsLike)
      {
        fill(52,255, 110); // triangle's color is green if mild weather (not too hot or cold)
      }
      else
      {
        fill(52, 255, 110); // triangle's color is green if mild weather (not too hot or cold)
      }

      triangle(
        x, y - 7,
        x - 7, y + 7,
        x + 7, y + 7
      );
    }
    else if (temperature < 20) // conditional statement to check if the temperature is less than 20
    {
      fill(246, 250, 35); // circle's color is yellow if temperature is less than 20 but higher than 15
      ellipse(x, y, 10, 10);
    }
    else
    {
      fill(234, 47, 14); // circle's color is red if temperature is more than 20 degrees

      if (feelsLike)
      {
        rect(x - 7, y - 4, 14, 8);
      }
      else
      {
        rect(x - 7, y - 4, 14, 10);
      }
    }
  }
}
