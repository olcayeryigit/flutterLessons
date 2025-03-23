void main() {
  selamVer("Olcay");
  selamVer("Ahmet");
  var hesapSonucu = hesapla(100, 10);
  print(hesapSonucu);

  test1(1, 2, 3);
  //
  test2(1);
  //
  test3(1);
  //
  test4(); // Çıktı: 0, 0, 0
  test4(sayi1: 10); // Çıktı: 10, 0, 0
  test4(sayi1: 10, sayi2: 5); // Çıktı: 10, 5, 0
  test4(sayi1: 10, sayi2: 5, sayi3: 15); // Çıktı: 10, 5, 15
}

void selamVer(String kullanici) {
  print("Selam" + kullanici);
}

double hesapla(double krediTutari, double yuzde) {
  var sonuc = krediTutari * yuzde / 100;
  return sonuc;
}

void test1(int sayi1, int sayi2, int sayi3) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}

//Daha esnek, parametre girmesem de hata vermesin varsayılan değer olsun
void test2(int sayi1, [int sayi2 = 0, int sayi3 = 0]) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}

//Eğer varsayılan değer istemiyorsan ama null gelirse kontrol etmek istiyorsan
/*?? operatörü, "null-aware" (null farkındalığı olan) bir operatördür.
//Anlamı:
Eğer sol taraftaki değer null ise sağdaki değeri kullanır.
Eğer sol taraftaki değer null değilse, olduğu gibi kullanılır*/
void test3(int sayi1, [int? sayi2, int? sayi3]) {
  print(sayi1);
  print(sayi2 ?? 'Sayi2 yok');
  print(sayi3 ?? 'Sayi3 yok');
}

void test4({int sayi1 = 0, int sayi2 = 0, int sayi3 = 0}) {
  print(sayi1);
  print(sayi2);
  print(sayi3);
}
