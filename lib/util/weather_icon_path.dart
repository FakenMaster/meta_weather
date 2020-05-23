extension WeatherIconPathExtension on String{
  String iconSVG(){
    return "https://www.metaweather.com/static/img/weather/$this.svg";
  }

  String iconICO(){
    return "https://www.metaweather.com/static/img/weather/ico/$this.ico";
  }

  String iconPNG(){
    return "https://www.metaweather.com/static/img/weather/png/$this.png";
  }

  String icon64PNG(){
    return "https://www.metaweather.com/static/img/weather/png/64/$this.png";
  }
}