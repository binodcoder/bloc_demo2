import 'package:bloc/bloc.dart';
import 'package:bloc_demo2/data/model/weather.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeather>((event, emit) {
      emit(WeatherLoading());
      final weather = _fetchWeatherFromFakeApi(event.cityName);
      emit(WeatherLoaded(weather));
    });
  }
  _fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return Weather(
          cityName,
          50,
        );
      },
    );
  }

  void dispose() {}
}
