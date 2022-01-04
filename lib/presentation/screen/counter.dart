import 'package:bloc_demo2/logic/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
              //BlocProvider.of<CounterBloc>(context).add(Increment());
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              context.read<CounterBloc>().add(Decrement());
              //BlocProvider.of<CounterBloc>(context).add(Decrement());
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, count) {
          return Text('${count.counterValue}');
        },
      ),
    );
  }
}
