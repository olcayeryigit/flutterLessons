//Ders 7.3- 18.03
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

  Personel.withData(String firstName, String lastName, int dateOfStart)
    : this.dateOfStart = dateOfStart,
      super.withData(firstName, lastName);
}

class Person {
  late String firstName;
  late String lastName;
  Person();

  Person.withData(this.firstName, this.lastName);
}
