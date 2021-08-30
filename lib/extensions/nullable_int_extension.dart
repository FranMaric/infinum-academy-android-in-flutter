/// Extension on int? to easily check if an int? is a successful response status code
/// Used by [ShowsRepository()] and [AuthenticationClient()]
extension NullableIntExtension on int? {
  bool get isSuccessful {
    if (this == null) {
      return false;
    }
    return this! >= 200 && this! < 300;
  }
}
