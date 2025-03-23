import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

//ListView Kullanımı
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mesaj")),
      body: Column(
        children: [
          Expanded(child: ListView(children: [Text("Olcay"), Text("Ahmet")])),
          Center(child: Text("Selam")),
        ],
      ),
    );
  }
}
