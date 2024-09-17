import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
//ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({
    super.key,
    required this.title,
  });
   ValueNotifier<int> valor = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Theme.of(context).primaryColorDark,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          ValueListenableBuilder(
            valueListenable: valor,
            builder: (BuildContext context, int value, Widget? child) {
              return Center(
                child: Text(
                  'valor do campo é: $value',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        foregroundColor: Colors.white,
        onPressed: () => valor.value++,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
