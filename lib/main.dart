import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;

    final myAppBar = AppBar(
      title: const Text('Layout Builder'),
    );

    final bodyHeight = heightApp - paddingTop - myAppBar.preferredSize.height;

    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: Container(
          width: widthApp * 0.9,
          height: bodyHeight * 0.7,
          color: Colors.brown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyContainer(widthApp: widthApp),
              MyContainer(widthApp: widthApp),
              MyContainer(widthApp: widthApp),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final double widthApp;
  const MyContainer({super.key, required this.widthApp});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contex, constraints) {
        return Container(
          width: widthApp * 0.25,
          height: constraints.maxHeight * 0.5,
          color: Colors.amber,
        );
      },
    );
  }
}
