import 'package:flutter/material.dart';

import 'http_calling.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Randomizer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    late Future<Randomizer> futureRandomizer;

  @override
  void initState(){
    super.initState();
    futureRandomizer = fetchRandomizer();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: ElevatedButton(
          onPressed: () => fetchRandomizer() ,
          child: const Text(
            'Press here to generate Random Number',
            textAlign: TextAlign.center,
          )
        )
      ),



    );
  }

}

