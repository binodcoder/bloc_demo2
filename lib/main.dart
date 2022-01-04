import 'package:bloc_demo2/presentation/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/bloc/weather/weather_bloc.dart';

void main() {
  runApp(MaterialApp(
      home: BlocProvider(
    create: (context) => WeatherBloc(),
    child: const HomePage(),
  )));
}
