import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home:MyApp()
  ));
}

//Kendi widgetını oluşturma
class MyApp extends StatelessWidget {
    String mesaj="İlk Uygulamam";
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            print("Butona tıklandı");//Zorunlu
            var alert=AlertDialog(
              title: Text("Sınav Sonucu"),
              content: Text("Geçti"),
            );
            showDialog(context: context, builder: (BuildContext context)=>alert); //context:veri tutan yapı
          },
          child: Text("Sonucu Gör"),
        ),
      ),
    );
  }

}