mixin StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null || value.length < 2) {
      return "İsim en az 2 karakter olmalıdır";
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.length < 2) {
      return "Soyisim en az 2 karakter olmalıdır";
    }
    return null;
  }

  String? validateGrade(String? value) {
    if (value == null || value.isEmpty) {
      return "Not alanı boş olamaz";
    }

    final grade = int.tryParse(value);
    if (grade == null) {
      return "Geçerli bir sayı giriniz";
    }

    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır";
    }

    return null;
  }
}
