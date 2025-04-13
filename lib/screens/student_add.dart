import 'package:flutter/material.dart';
import 'package:my_app/models/student.dart';
import 'package:my_app/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

//Burada bir extends yaptık ikinci extends olmazi İki sınıf miras alınamaz, ancak dart dilinde ikinci bir sınıfı sanki onun içerisinde çağrılıyormuş gibi fonksiyonları kullanılabilsin diye with kullanılır, mixinlerde class ifadesi yerine mixin kullanılır,  mixinler bu şekilde with ile kullanılır
class _StudentAddState extends State with StudentValidationMixin {
  //Student modelinde bilgi olmadan constructor yapmıştık onunla boş Student nesnesi oluşturalım
  var student = Student.withoutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci Ekleme İşlemi")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Öğrenci Adı:",
                  hintText: "Olcay",
                ),
                validator: validateFirstName, //mixinden alınır
                //formda alınan bilgileri bir nesneye aktarmamız gerekir, bunun için bu classta yukarda bir öğrenci nesnesi oluşturalım, bilgileri o nesneye yerleştirelim
                onSaved: (String? value) {
                  student.firstName = value ?? '';
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
