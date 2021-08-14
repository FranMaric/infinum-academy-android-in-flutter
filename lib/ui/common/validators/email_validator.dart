String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Mail must not be empty';
  }
  final bool isNotValidEmail = !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  if (isNotValidEmail) {
    return 'Not a valid email';
  }
  return null;
}
