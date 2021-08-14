String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password must not be empty';
  }
  if (password.length < 6) {
    return 'Password length must be at least 6 characters';
  }
  return null;
}
