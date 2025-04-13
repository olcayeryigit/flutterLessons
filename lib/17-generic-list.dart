void main() {
  //Veri tipini belirtmeden sabit boyutlu liste oluşturuyoruz
  var urunler1 = List<dynamic>.filled(
    5,
    null,
  ); // dynamic tipinde sabit boyutlu liste

  urunler1[0] = "Laptop"; // String eklenebilir
  urunler1[1] = 42; // int eklenebilir
  urunler1[2] = true; // bool eklenebilir

  print(urunler1); // [Laptop, 42, true, null, null]

  //Veri Tipi Belirli Olan Dizi
  List<String> urunler2 = ["Mouse", "Laptop", "Keyboard"];
  //GENERİC LİSTE
  // Product sınıfında parametre alan constructor tanımlandı
  var product1 = Product("TV", 500);
  var product2 = Product("Fırın", 800);

  List<Product> products = [product1, product2];
  print(products);
  print(products[0].name);
}

class Product {
  late String name;
  late double unitPrice;

  Product(this.name, this.unitPrice); // Varsayılan constructor parametre aldı.
}
