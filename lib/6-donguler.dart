void main() {
  var sayilar = [1, 2, 3, 4, 5];

  // 1️⃣ FOR DÖNGÜSÜ
  print("For Döngüsü:");
  for (int i = 0; i < sayilar.length; i++) {
    print("Sayı: ${sayilar[i]}");
  }

  // 2️⃣ WHILE DÖNGÜSÜ
  print("\nWhile Döngüsü:");
  int sayac = 0;
  while (sayac < sayilar.length) {
    print("Sayı: ${sayilar[sayac]}");
    sayac++;
  }

  // 3️⃣ DO-WHILE DÖNGÜSÜ
  print("\nDo-While Döngüsü:");
  int index = 0;
  do {
    print("Sayı: ${sayilar[index]}");
    index++;
  } while (index < sayilar.length);

  // 4️⃣ FOREACH DÖNGÜSÜ
  print("\nforEach ile Liste Döngüsü:");
  sayilar.forEach((sayi) => print("Sayı: $sayi"));

  // 5️⃣ FOR-IN DÖNGÜSÜ
  print("\nFor-in ile Liste Döngüsü:");
  for (var sayi in sayilar) {
    print("Sayı: $sayi");
  }
}
