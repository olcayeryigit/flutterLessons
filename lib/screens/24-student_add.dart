import 'package:flutter/material.dart';
import 'package:my_app/models/student.dart';
import 'package:my_app/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

//23-student_add.dart yapısında bazı düzenlemeler yapalım, spagetti kod olmasın yapı, textformfieldları seçip keselim, onun yerine fonksiyon oluşturalım--> buildFirstNameField(),Widget buildLastNameField  buildGradeField
class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withoutInfo();
  var formKey =
      GlobalKey<
        FormState
      >(); //Form için global key, Form durumunu yöneten yapı, Form durumu için bir anahtar üret demiş oluruz, bu keyi aşağıda form özelliğine eklerim
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci Ekleme İşlemi")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key:
              formKey, //Yukarıdaki global key i burada belirttik, Formla ilgili statei artık burada tutmuş oluruz
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı:", hintText: "Olcay"),
      validator: validateFirstName,
      onSaved: (String? value) {
        student.firstName = value ?? '';
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Öğrenci Soyadı:",
        hintText: "Eryiğit",
      ),
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value ?? '';
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Sınav Notu:", hintText: "50"),
      validator: validateGrade,
      onSaved: (String? value) {
        if (value != null && value.isNotEmpty) {
          student.grade = int.parse(
            value,
          ); //aldığımız stringi int e çevirelim, student objesinde grade int tipinde
        } else {
          student.grade = 0; // veya varsayılan bir değer
        }
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        //Burada yukardaki onsavedleri tetikleyeceğiz
        //Önce formlrdaki doğrulama işlemlerini yap sonra kaydet diyeceğiz
        //Yukarıdaki forma erişebilmek için, forma global key isimli bir unique değer atamamız gerekir
        if (formKey.currentState!.validate()) {
          //Form validasyonu (validate formdaki validator leri çalıştırır) sağlandıysa eğer,formdaki onSaved leri çalıştırır işlemi yapılsın
          formKey.currentState!.save();
          //print("Kayıt başarılı");
          //print(student.firstName);
          //print(student.lastName);
          //print(student.grade);
          //Student listesine kayıt işlemini 25-student_add.dart ta yapacağım
        }
      },
    );
  }
}
