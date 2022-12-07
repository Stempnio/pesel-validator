import 'package:pesel_validator/pesel_validator.dart';

void main() {
  const validPesel = '92071314764';
  const invalidPesel = '00000000000';

  // pesel number validation
  validatePesel(pesel: validPesel); // true
  validatePesel(pesel: invalidPesel); // false

  // sex from pesel number
  sexFromPesel(pesel: validPesel); // Sex.woman
  // sexFromPesel(pesel: invalidPesel); // throws InvalidPeselException

  // date of birth from pesel
  dateOfBirthFromPesel(pesel: validPesel); // DateTime (13.07.1992)
  // dateOfBirthFromPesel(pesel: invalidPesel); // throws InvalidPeselException

  // age from pesel
  ageFromPesel(pesel: validPesel); // int age value
  // ageFromPesel(pesel: invalidPesel); // throws InvalidPeselException
}
