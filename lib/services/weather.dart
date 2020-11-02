import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey='d884d6fd7f0ede3b5307ac7eba1902a1';
const openWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityweather(String cityName) async{
    var url='$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
  NetworkHelper networkhelper=NetworkHelper(url);
  var weatherData=await networkhelper.getData();
  return weatherData;
  }
  Future<dynamic> getLocationWeather() async{
    Location location=Location();
    await location.getCurrentLocation();
    NetworkHelper networkhelper=NetworkHelper('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherdata=await networkhelper.getData();
    return weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
