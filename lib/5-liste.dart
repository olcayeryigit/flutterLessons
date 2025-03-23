void main() {
  // Sabit boyutlu liste (null değer kullanılabilir)
  var urunler = List<String?>.filled(5, null);

  // Dinamik (Growable) Liste (Önerilen)
  var urunler1 = <String>[];

  // Özel başlangıç değerli, dinamik liste
  var urunler2 = List.generate(5, (index) => index * 2, growable: true);

  //ÖRNEK:1
  // Sayılar listesi
  var sayilar = [10, 25, 30, 45, 60];

  //ilk Elemanı Yazdır
  print(sayilar.first);

  // 30'dan büyük olanları filtrele
  var filtrelenmis = sayilar.where((sayi) => sayi > 30);

  // Çıktıyı ekrana yaz
  print(filtrelenmis.toList()); // [45, 60]

  //ÖRNEK:2
  var sehirler = ["Ankara", "İstanbul", "İzmir", "Adana", "Bursa", "Eskişehir"];

  // "a" harfini içeren şehirleri filtrele (büyük-küçük harf duyarlı)
  var a_icerenler = sehirler.where((sehir) => sehir.contains("a"));

  print(a_icerenler.toList()); // ["Ankara", "Adana", "Bursa"]
}
