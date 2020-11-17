class FormValidationHelper {
  static String validateEmail(String email) {
    if (email.isEmpty) {
      return "The email field cannot be empty";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Please make sure your email address is valid';
    else
      return null;
  }

  static String validateEmptyField(String value) =>
      value.length < 4 || value.isEmpty ? "Field can't be empty!" : null;

  static String validatePassword(String value) => value.isEmpty
      ? 'The password field cannot be empty'
      : value.length < 8
          ? 'Weak password!. Use longer password'
          : null;

  static String isPasswordMatched(String pwd1, String pwd2) {
    if (pwd2.isEmpty || pwd1.isEmpty) {
      return 'The password field cannot be empty';
    }
    if (pwd1.compareTo(pwd2) != 0) {
      return 'Password mismatched!';
    } else {
      return null;
    }
  }
}
