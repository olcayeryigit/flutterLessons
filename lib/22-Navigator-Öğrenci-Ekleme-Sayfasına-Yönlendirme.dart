//NAVİGASYON
//ÖĞRENCİ EKLEME İŞLEMİ
//Öğrenci ekle butonuna bastığımda beni öğrenci ekle sayfasına götürsün
//lib klasörü içerisine screens diye bir klasör ekleyelim
import 'package:flutter/material.dart';
import 'package:my_app/models/student.dart';
import 'package:my_app/screens/student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = new Student.withId(0, "", "", 0);

  List<Student> students = [
    new Student.withId(1, "Olcay", "Eryiğit", 50),
    Student.withId(2, "Onur", "Eryiğit", 40),
    Student.withId(3, "Sati", "Eryiğit", 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Öğrenci Sınav Durumu")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                    ),
                  ),
                  title: Text(
                    "Öğrenci İsim Soyisim: " +
                        students[index].firstName +
                        " " +
                        students[index].lastName,
                  ),
                  subtitle: Text(
                    "Öğrenci Notu: " +
                        students[index].grade.toString() +
                        " " +
                        "Öğrenci Durumu: " +
                        students[index].getStatus,
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    print(students[index].grade.toString());

                    setState(() {
                      selectedStudent = students[index];
                    });
                  },
                );
              },
            ),
          ),

          Text(
            "Seçili Öğrenci: " + selectedStudent.firstName,
            style: TextStyle(color: Colors.black),
          ),

          Row(
            children: <Widget>[
              //Öğrenci ekleme butonuna basıldığında navigator ile öğrenci ekleme screen ine gidelim
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    //YENİ ÖĞRENCİ EKLEME SAYFASINA GÖTÜRME
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentAdd()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Köşeleri sıfır yapar
                    ),
                    backgroundColor: Colors.greenAccent,
                    iconColor: Colors.black,
                  ),

                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5),
                      Text(
                        "Yeni Öğrenci",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,

                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: Colors.purpleAccent,
                    iconColor: Colors.black,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.update),
                      SizedBox(width: 5),
                      Text("Güncelle", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    var message =
                        selectedStudent.firstName + " isimli öğrenci silindi";

                    mesajGoster(context, message);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: Colors.deepOrange,
                    iconColor: Colors.black,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 5),
                      Text("Sil", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildStatusIcon(int grade) {
  if (grade >= 50) {
    return Icon(Icons.done);
  } else if (grade >= 40 && grade < 50) {
    return Icon(Icons.question_mark);
  } else {
    return Icon(Icons.clear);
  }
}

void mesajGoster(BuildContext context, String message) {
  var alert = AlertDialog(title: Text("İşlem Sonucu"), content: Text(message));
  showDialog(context: context, builder: (BuildContext context) => alert);
}
