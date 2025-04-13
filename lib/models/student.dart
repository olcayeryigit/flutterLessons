class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade;
  late String
  _status; //dart dilinde public private yoktur, Durum grade de bağlı olarak otomatik set edilir o yüzden _ ile kullanırız,

  //Güncelleme silme gibi operasyonlarda id gereklidir, ancak ekleme operasyonlarında genellikle id verilmez, bu sebeple aşağıda bir de id verilmeden bir yapı oluşturacağım
  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    //this._status = ""; //Status grade e bağlı olarak kendiliğinden aşağıda set olur, bu sebeple burada construct etmeye yani yapılandırmaya gerek yoktur
  }

  //IDsiz öğrenci için constructor
  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  //Yeni öğrenci ekleme işlemi yapılırken,hiç bir data vermeden obje oluşturmak için constructor
  Student.withoutInfo() {}

  //GETTER - SETTER
  //İlgili nesnenin bir özelliğiyle ilgili değişiklik yapılacaksa getter(okuma) ve setter(yazma) kullanılır

  String get getFirstName {
    return "OGRENCI - " + this.firstName;
  }

  void set setFirstName(String value) {
    this.firstName = value;
  }

  //Burada status grade e bağlık olarak oluşur, bu yüzden burada status için setter a gerek yoktur sadece getter kullanılır

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40 && this.grade < 50) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
