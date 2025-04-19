// screens/student_add.dart

import 'package:flutter/material.dart';
import '../models/student.dart';
import '../validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students; // 🔸 Ana sayfadan gelen öğrenci listesi

  StudentAdd(this.students); // 🔸 Constructor ile liste alındı

  @override
  State<StatefulWidget> createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
  var student = Student.withoutInfo(); // 🔸 Boş öğrenci nesnesi
  var formKey = GlobalKey<FormState>(); // 🔸 Formun kontrolü için anahtar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni Öğrenci Ekle")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey, // 🔸 Form anahtarı
          child: Column(
            children: [
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

  // 🔹 Ad alanı
  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ad", hintText: "Olcay"),
      validator: validateFirstName,
      onSaved: (String? value) {
        student.firstName = value ?? '';
      },
    );
  }

  // 🔹 Soyad alanı
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Soyad", hintText: "Eryiğit"),
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value ?? '';
      },
    );
  }

  // 🔹 Not alanı
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Not", hintText: "80"),
      validator: validateGrade,
      onSaved: (String? value) {
        student.grade = int.tryParse(value ?? '0') ?? 0;
      },
      keyboardType: TextInputType.number,
    );
  }

  // 🔹 Kaydet butonu
  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          // 🔸 Listeye yeni öğrenci ekleniyor
          widget.students.add(student);
          // Güncellenmiş listeyi geri gönder, push olarak geldiğimiz yere navigator.pop() ile geri döneriz(ana sayfaya geri dönüş)
          Navigator.pop(context, widget.students);
        }
      },
    );
  }
}
