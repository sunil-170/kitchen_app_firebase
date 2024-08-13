class AppException implements Exception {
  final String _massege;
  final String _prifix;

  AppException(this._massege, this._prifix);

  @override
  String toString() {
    return "$_massege,$_prifix";
  }
}

class InvalidInputException extends AppException {
  InvalidInputException(String msg) : super(msg, "Invlid Input");
}
