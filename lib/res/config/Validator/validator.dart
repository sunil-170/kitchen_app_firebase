// Abstract Validator class
abstract class FormValidator {
  String? validate(String? value);
}

// Email Validator class
class EmailValidator extends FormValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email address";
    } else if (!value.endsWith("@gmail.com")) {
      return "please enter a valid email address";
    } else {
      return null;
    }
  }
}

// Text Validator   class

class Text_Validator extends FormValidator {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "this field is required";
    } else {
      return null;
    }
  }
}
