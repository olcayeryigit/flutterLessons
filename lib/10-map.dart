void main() {
  // 📌 1️⃣ Map Tanımlama
  var ulkeler = {
    "TR": "Türkiye",
    "US": "Amerika",
    "DE": "Almanya",
    "FR": "Fransa",
  };

  print("Başlangıç: $ulkeler");

  // 📌 2️⃣ Eleman Silme (remove)
  ulkeler.remove("FR"); // "FR" anahtarlı elemanı siler
  print("Fransa silindikten sonra: $ulkeler");

  // 📌 3️⃣ containsKey Kullanımı
  if (ulkeler.containsKey("DE")) {
    print("Almanya listede var!");
  } else {
    print("Almanya listede yok!");
  }

  // 📌 4️⃣ for-in Döngüsü ile Anahtarları Yazdırma
  print("\nÜlkelerin Kısaltmaları:");
  for (var key in ulkeler.keys) {
    print(key);
  }

  // 📌 5️⃣ forEach Kullanımı
  print("\nÜlke Listesi:");
  ulkeler.forEach((key, value) {
    print("$key → $value");
  });

  print("\nÜlke Listesi:");
  ulkeler.forEach((key, value) {
    print(key + ":" + value);
  });
}
