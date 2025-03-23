import 'package:flutter/material.dart';

void main() {
  PersonelManager personelManager = PersonelManager();
  personelManager.add();

  var customerManager = CustomerManager();
  var customer = Customer.withData("Olcay", "Eryiğit"); // ✅ Doğru kullanım!

  customerManager.add(customer);
}
//*******CLASS******

// Personel yönetim sınıfı
class PersonelManager {
  void add() {
    print("Personel eklendi");
  }

  void update() {
    print("Personel güncellendi");
  }

  void delete() {
    print("Personel silindi");
  }
}

// Müşteri yönetim sınıfı
class CustomerManager {
  void add(Customer customer) {
    print("Müşteri eklendi: ${customer.firstName} ${customer.lastName}");
  }

  void update() {
    print("Müşteri güncellendi");
  }

  void delete() {
    print("Müşteri silindi");
  }
}

//  //Scaffold, appBar, ListView.. vs de bir classtır, newle kullansak da hata vermez
// ListView parametresiz constructor, ListView.builder ise parametreli constructor
// Müşteri sınıfı
class Customer {
  late String firstName;
  late String lastName;

  // Varsayılan (boş) constructor
  Customer();

  // Parametreli constructor
  Customer.withData(this.firstName, this.lastName);
}

/*  Dart’ta late anahtar kelimesi, bir değişkenin değerini daha sonra atayacağımızı Dart'a bildirmek için kullanılır.*/
