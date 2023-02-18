import 'package:bloc/bloc.dart';
import 'package:weather_app/bloc/weather_cubits/weather_state.dart';
import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState>
{
  WeatherCubit(this.weatherService) : super(InitialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
     weatherModel = await weatherService.getWeather(cityName: cityName);
    try {
      emit(WeatherSuccess());
    } on Exception catch (e){
      emit(WeatherFailure());
    }
  }

}