import 'package:weatherapp/data/model/weatherModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Abstract interface class defining the data source
abstract interface class DataSource {
  Future<List<WeatherDataModel>?> loadData();
}

/// Implementation of DataSource to fetch weather data from an API
class LoadDataWeather implements DataSource {
  @override
  Future<List<WeatherDataModel>?> loadData() async {
    // Create a list to contain WeatherDataModel objects
    List<WeatherDataModel> weatherDataList = [];
    try {
      final reponse = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?APPID=3af3abf90d6c4f546331175d2a1d90c5&q=HANOI&lang=vi'));

          if(reponse.statusCode == 200){

            final jsonData = jsonDecode(reponse.body);
            WeatherDataModel weatherDataModel = WeatherDataModel.formJson(jsonData);
            weatherDataList.add(weatherDataModel);
            return weatherDataList;
          }else{
            print("Failed to load data status code ${reponse.statusCode}");
          }
    } catch (e) {
      print(e);
    }
return null;
    // TODO: implement loadData
    throw UnimplementedError();
  }
}
