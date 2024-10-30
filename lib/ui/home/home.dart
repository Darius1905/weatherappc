import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/data/model/weatherModel.dart';
import 'package:weatherapp/data/repository/weatherRepository.dart';
import 'package:weatherapp/ui/home/viewModel.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Weather App',
      theme: ThemeData(primaryColor: Color(0xFF29B2DD),
      ),
      home: WeatherAppHome(),
    );

  }
}
class WeatherAppHome extends StatelessWidget {
  const WeatherAppHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          color: Color(0xFF29B2DD)
        ),
      ),
    );
  }
}
class HomeTabPageState extends StatefulWidget {
  const HomeTabPageState({super.key});

  @override
  State<HomeTabPageState> createState() => _HomeTabPageStateState();
}

class _HomeTabPageStateState extends State<HomeTabPageState> {
  List<WeatherDataModel> weatherData = [];
  late WeatherAppViewModel viewModel;

  @override
  void initState() {
    viewModel  = WeatherAppViewModel();
    viewModel.loadWeather();
    observeData();
    // TODO: implement initState
    super.initState();
  }
  void observeData(){
    viewModel.weatherSteam.stream.listen((weatherList){
      setState(() {
        weatherData.addAll(weatherList);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: weatherData.isEmpty ? Center(child: CircularProgressIndicator()): ListView.builder(
        itemCount: weatherData.length, // Thêm itemCount để xác định số lượng item
        itemExtent: 60.0, // Đặt chiều cao cố định cho mỗi item
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${weatherData[index].timezone}'), // Sửa lại phần kết thúc chuỗi
          );
        },
      ),
    );
  }

}
