class AuthFailure {
  final String? code;
  final String message;
  final String? field; // New field for targeting specific UI inputs

  AuthFailure({this.code, required this.message, this.field});
}
