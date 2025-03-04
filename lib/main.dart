import 'package:flutter/material.dart';
import 'package:flutter_code4func_10_stream/my_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyBloc bloc = MyBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STREAM"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: StreamBuilder(
              stream: bloc.counterStream,
              builder: (context, snapshot) => Text(
                    snapshot.hasData ? snapshot.data.toString() : "0",
                    style: const TextStyle(fontSize: 30, color: Colors.amber),
                  )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
