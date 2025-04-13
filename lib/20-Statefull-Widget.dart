import 'package:flutter/material.dart';
import 'package:my_app/models/student.dart';

//Stateless widgetlar ekranın daha hızlı çizildiği ancak durum yönetimi ihtiyacı olmayan widget türüdür, stateless widgetlarda ekran bir defa çizilir bir daha da çizilmez yani bir değer değiştirilirse o değer değişimi ekrana yansımaz, ancak biz uygulamalarımızda çoğunlukta durum yönetimi yani değişikliklerin yansıması gerekir
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
} /*Burada aslında arrow foknsiyonla hızlı çağrılma yapılmış, Burada aslında bir tane _MyAppState(); fonksiyonu döndüren ismi createState() olan bir fonksiyon oluşturuluyor
  class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState()
  return _MyAppState();
  }
  dir
   */

class _MyAppState extends State<MyApp> {
  String SeciliOgrenci = "Abc";

  List<Student> students = [
    new Student("Olcay", "Eryiğit", 50),
    Student("Onur", "Eryiğit", 40),
    Student("Sati", "Eryiğit", 20),
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
                    //ONTAP
                    /*    SeciliOgrenci =
                        students[index].firstName +
                        " " +
                   students[index].lastName;
                  Bu şekilde set olmaz
                  */
                    /*Ekranın yeniden çizilmesini tetiklememiz gerekir, bunun için setState fonksiyonu gerekir */

                    setState(() {
                      SeciliOgrenci =
                          students[index].firstName +
                          " " +
                          students[index].lastName;
                    });
                  },
                );
              },
            ),
          ),
          //BURADA ONTAP İLE TIKLANAN SEÇİLİ ÖĞRENCİNİN ADI YAZSILSIN
          Text("Seçili Öğrenci: " + SeciliOgrenci),
          Center(
            child: ElevatedButton(
              onPressed: () {},

              child: Text("Öğrenci Durumunu Gör"),
            ),
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
