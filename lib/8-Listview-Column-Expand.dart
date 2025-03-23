import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

//Veriler dinamik gelirse ListView Kullanımı
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Olcay", "Ahmet", "Onur", "Simge"];
    return Scaffold(
      appBar: AppBar(title: Text("Mesaj")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:
                  ogrenciler
                      .length, //length(eleman sayısı) kadar, itemBuilder çalışır
              itemBuilder: (BuildContext context, int index) {
                return Text(ogrenciler[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
