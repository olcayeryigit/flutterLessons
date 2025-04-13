mixin StudentValidationMixin {
  String? validateFirstName(String? value) {
    if (value == null || value.length < 2) {
      return "İsim en az 2 karakter olmalıdır";
    }
    return null;
  }
}
