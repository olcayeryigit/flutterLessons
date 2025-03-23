import 'package:flutter/material.dart';

void main(){
  String mesaj="İlk Uygulamam";
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            print("Butona tıklandı");//Zorunlu
          },
          child: Text("Sonucu Gör"),
        ),
      ),
    )
  ));
}