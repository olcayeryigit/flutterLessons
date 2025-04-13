import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sayilar = [1, 6, 3];
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sayilar.length, //builder i çalıştırma sayısı
              itemBuilder: (BuildContext context, int index) {
                return Text(sayilar[index].toString());
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                int sonuc = toplam(sayilar);
                toplamGoster(context, sonuc);
              },
              child: Text("Toplamı Gör"),
            ),
          ),
        ],
      ),
    );
  }
}

//Dizi elemanlarını toplayan, toplamı döndüren fonksiyon
int toplam(List<int> sayilar) {
  return sayilar.fold(
    0,
    (sum, sayi) => sum + sayi,
  ); //reduce de kullanılabilir, fold 0 seçeneği sunar
}

//Alert fonksiyonu
void toplamGoster(BuildContext context, int sonuc) {
  var alert = AlertDialog(
    title: Text("Toplam"),
    content: Text(sonuc.toString()),
  );
  showDialog(context: context, builder: (BuildContext content) => alert);
}
