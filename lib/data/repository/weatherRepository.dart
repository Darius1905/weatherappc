import 'package:weatherapp/data/model/weatherModel.dart';
import 'package:weatherapp/data/source/weatherSource.dart';

abstract interface class weatherRepository{
  Future<List<WeatherDataModel>?> loadData();
}
class DefaultRepository implements weatherRepository{
  final LoadDataWeather _loadDataSource;
  DefaultRepository({LoadDataWeather? loadDataSource})
      : _loadDataSource = loadDataSource ?? LoadDataWeather();

  @override
  Future<List<WeatherDataModel>?> loadData() async {
     final LoadDataWeather loadDataWeather;

      try {
        // Lấy dữ liệu từ data source
        final loadData = await _loadDataSource.loadData();

        if (loadData != null && loadData.isNotEmpty) {
          return loadData;
        } else {
          print("Error: No data found.");
          return [];
        }
      } catch (e) {
        print("Error loading data: $e");
        return [];
      }


    throw UnimplementedError();
  }

}