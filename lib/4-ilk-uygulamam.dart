import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

//Kendi widgetını oluşturma
class MyApp extends StatelessWidget {
  String mesaj = "İlk Uygulamam";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mesaj)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            int puan = 45;
            String mesaj = "";
            if (puan >= 50) {
              mesaj = "Geçti";
            } else if (puan >= 40) {
              mesaj = "Bütünleme";
            } else {
              mesaj = "Kaldı";
            }
            var alert = AlertDialog(
              title: Text("Sınav Sonucu"),
              content: Text(mesaj),
            );
            showDialog(
              context: context,
              builder: (BuildContext context) => alert,
            ); //context:veri tutan yapı
          },
          child: Text("Sonucu Gör"),
        ),
      ),
    );
  }
}
