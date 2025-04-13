import 'package:flutter/material.dart';

//12-fonk-uygulama-dart taki uygulamada, column u ayıralım
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  //veriyi bu şekilde üstte tanımlarız(scope için), bir çok yerde geçerli olur
  var sayilar = [1, 6, 3];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: buildBody(context),
    );
  }

  int toplam(List<int> sayilar) {
    return sayilar.fold(0, (sum, sayi) => sum + sayi);
  }

  void toplamGoster(BuildContext context, int sonuc) {
    var alert = AlertDialog(
      title: Text("Toplam"),
      content: Text(sonuc.toString()),
    );
    showDialog(context: context, builder: (BuildContext content) => alert);
  }

  //buildBody bir widget döndürmeli
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: sayilar.length,
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
    );
  }
}
