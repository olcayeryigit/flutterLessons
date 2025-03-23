import 'package:flutter/material.dart';

void main() {
  PersonelManager personelManager = PersonelManager();
  personelManager.add();

  var customerManager = CustomerManager();
  Customer customer1 = Customer.withData("Olcay", "Eryiğit");
  //var customer1 = Customer.withData("Olcay", "Eryiğit"); aynı
  Customer customer2 = Customer.withData("Onur", "Eryiğit");
  Person customer3 = Customer.withData("Ahmet", "Eryiğit");

  customerManager.add(customer1);
  customerManager.add(customer2);
}

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

class Customer extends Person {
  Customer() : super();

  Customer.withData(String firstName, String lastName)
    : super.withData(firstName, lastName);
}

class Personel extends Person {
  late int dateOfStart;
  Personel() : super();

  // dateOfStart'ı da initializer list içinde başlattık
  Personel.withData(String firstName, String lastName, int dateOfStart)
    : this.dateOfStart = dateOfStart, // this ile sınıf değişkenini başlatıyoruz
      super.withData(
        firstName,
        lastName,
      ); // Üst sınıfın constructor'ını çağırıyoruz
}

//customer ve personel birer kişidir  yani ikisi de persondır, ikisinin de first name i ve last name i vardır,
class Person {
  late String firstName;
  late String lastName;
  // Boş constructor eklendi!
  Person();

  Person.withData(this.firstName, this.lastName);
}
