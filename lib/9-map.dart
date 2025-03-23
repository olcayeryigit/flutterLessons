import 'package:flutter/material.dart';

void main() {
  //1-Eski yöntem, artık önerilmiyor!
  void main() {
    var sehirler = new Map();
    sehirler["FR"] = "Fransa";
    sehirler["TR"] = "Türkiye";

    print(sehirler); // {FR: Fransa}
  }

  //2- Boş bir Map oluşturduk
  Map<String, int> yaslar = {};
  yaslar["Ali"] = 25; // Eleman ekleme
  yaslar["Ayşe"] = 30;

  print(yaslar); // Çıktı: {Ali: 25, Ayşe: 30}

  //3- Başlangıçta tanımlama
  var ogrenci = {"ad": "Mehmet", "yas": 20, "okul": "Üniversite"};
  print(ogrenci["ad"]); // Mehmet
  print(ogrenci["yas"]); // 20
}
