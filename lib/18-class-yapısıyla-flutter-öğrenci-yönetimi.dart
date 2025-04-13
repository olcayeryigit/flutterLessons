import 'package:flutter/material.dart';
import 'package:my_app/models/student.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

//Student classından studentler oluşturalım (Student Modeli)
class MyApp extends StatelessWidget {
  List<Student> students = [
    new Student(
      "Olcay",
      "Eryiğit",
      50,
    ), //newleyerek veya direkt newlemeden obje oluşturmanın farkı yok
    Student("Onur", "Eryiğit", 40),
    Student("Sati", "Eryiğit", 20),
  ];
  //Burada students dizisine add ile student ekleyemeyiz, çünkü methodlar class seviyesinde çalışmaz, method yani üstteki main void gibi bir method içerisinde çağırabiliriz

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
                /*return Text(
                  students[index].firstName + " " + students[index].lastName,*/

                //Listviewle çalışırken en çok kullanılan widget ListTile dır, ListTile Listenin içerisinde her bir elemanın hangi özelleğinin nereye yerleştirileceğini söylediiğimiz kısım

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", //image i de Student clasına ekleyip getirelim, her bir öğrenci resmi
                    ), //webde bir resim
                  ),
                  title: Text(
                    "Öğrenci İsim Soyisim: " +
                        students[index].firstName +
                        " " +
                        students[index].lastName,
                  ),
                  subtitle: Text(
                    "Öğrenci Notu: " + students[index].grade.toString(),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    //Her tıkladığımızda gerçekeleşecek method
                    print(students[index].grade.toString());
                  },
                );
              },
            ),
          ),
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

//puana göre icon dönen bir fonksiyon yazalım
//icon bir widgettır , widget döndermemiz gerekir methodda
Widget buildStatusIcon(int grade) {
  if (grade >= 50) {
    return Icon(Icons.done);
  } else if (grade >= 40 && grade < 50) {
    return Icon(Icons.question_mark);
  } else {
    return Icon(Icons.clear);
  }
}
