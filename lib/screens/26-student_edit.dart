import 'package:flutter/material.dart';
import '../models/student.dart';
import '../validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedStudent; // Güncelleme işlemi için bir öğrenci gönderilir

  StudentEdit({
    required this.selectedStudent,
  }); // Öğrenci parametre olarak alınır

  @override
  State<StatefulWidget> createState() => _StudentEditState();
}

class _StudentEditState extends State<StudentEdit> with StudentValidationMixin {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Öğrenciyi Güncelle")),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
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

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue:
          widget
              .selectedStudent
              .firstName, // Başlangıç değeri mevcut isme göre ayarlandı
      decoration: InputDecoration(labelText: "Ad", hintText: "Olcay"),
      validator: validateFirstName,
      onSaved: (String? value) {
        widget.selectedStudent.firstName = value ?? ''; // Güncelleme yapılacak
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue:
          widget
              .selectedStudent
              .lastName, // Başlangıç değeri mevcut soyada göre ayarlandı
      decoration: InputDecoration(labelText: "Soyad", hintText: "Eryiğit"),
      validator: validateLastName,
      onSaved: (String? value) {
        widget.selectedStudent.lastName = value ?? ''; // Güncelleme yapılacak
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue:
          widget.selectedStudent.grade
              .toString(), // Başlangıç değeri mevcut notla ayarlandı
      decoration: InputDecoration(labelText: "Not", hintText: "80"),
      validator: validateGrade,
      onSaved: (String? value) {
        widget.selectedStudent.grade =
            int.tryParse(value ?? '0') ?? 0; // Güncelleme yapılacak
      },
      keyboardType: TextInputType.number,
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          // Öğrenci güncellenip ana sayfaya gönderiliyor
          Navigator.pop(context, widget.selectedStudent);
        }
      },
    );
  }
}
