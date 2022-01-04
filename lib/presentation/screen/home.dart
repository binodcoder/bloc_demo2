import 'package:bloc_demo2/data/model/weather.dart';
import 'package:bloc_demo2/logic/bloc/counter/counter_bloc.dart';
import 'package:bloc_demo2/logic/bloc/weather/weather_bloc.dart';
import 'package:bloc_demo2/presentation/screen/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherBloc = WeatherBloc();

  @override
  void dispose() {
    weatherBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Weather App'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                            create: (_) => CounterBloc(),
                            child: const CounterPage(),
                          )));
            },
            child: const Icon(Icons.countertops),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: BlocProvider.of<WeatherBloc>(context),
          builder: (BuildContext context, WeatherState state) {
            Widget child = const SizedBox();
            if (state is WeatherInitial) {
              child = buildInitial();
            } else if (state is WeatherLoading) {
              child = buildLoading();
            } else if (state is WeatherLoaded) {
              child = buildLoaded(state.weather);
            }
            return child;
          },
        ),
      ),
    );
  }
}

Widget buildInitial() {
  return const Center(
    child: CityInputField(),
  );
}

Widget buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildLoaded(Weather weather) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        weather.cityName,
        style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
      ),
      Text(
        weather.temperature.toString(),
        style: const TextStyle(fontSize: 80),
      ),
      const CityInputField()
    ],
  );
}

class CityInputField extends StatefulWidget {
  const CityInputField({Key? key}) : super(key: key);

  @override
  _CityInputFieldState createState() => _CityInputFieldState();
}

class _CityInputFieldState extends State<CityInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: submitCityName,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: "Enter a city",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }

  void submitCityName(String cityName) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(GetWeather(cityName));
  }
}
