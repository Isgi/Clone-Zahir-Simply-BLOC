import 'package:validate/validate.dart';

String validateEmail(String value) {
  try {
    Validate.isEmail(value);
  } catch (e) {
    return 'The E-mail Address must be a valid email address.';
  }
  return null;
}

String validatePassword(String value) {
  if (value.length < 8) {
    return 'The Password must be at least 8 characters.';
  }
  return null;
}
