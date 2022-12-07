import 'package:quiver/iterables.dart';
part 'utils.dart';

/// Exception thrown when given pesel number is invalid
class InvalidPeselException implements Exception {}

/// method that validates whether PESEL number is correct.
/// returns true if pesel is correct, else false.
///
/// ```dart
/// PeselValidator.validate("80072909146") == true
/// PeselValidator.validate("AAAAAAAAAAA") == true
/// ```
bool validatePesel({
  required String pesel,
}) {
  if (pesel.length != 11) {
    return false;
  }

  if (!RegExp(r'^[0-9]+$').hasMatch(pesel)) {
    return false;
  }

  final peselNumbers = pesel.split('').map(int.parse).toList();
  final weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3];

  final weightedSum = zip([peselNumbers, weights])
      .map((e) => (e[0] * e[1]) % 10)
      .reduce((value, element) => value + element);

  final controlSum = 10 - (weightedSum % 10);

  if (controlSum != peselNumbers[10]) {
    return false;
  }

  return true;
}

/// returns age from pesel number
///
/// throws [InvalidPeselException] if pesel number is invalid
int ageFromPesel({
  required String pesel,
}) {
  if (!validatePesel(pesel: pesel)) {
    throw InvalidPeselException();
  }

  return DateTime.now().difference(dateOfBirthFromPesel(pesel: pesel)).inDays ~/
      365;
}

/// returns date of birth from pesel number
///
/// throws [InvalidPeselException] if pesel number is invalid
DateTime dateOfBirthFromPesel({
  required String pesel,
}) {
  if (!validatePesel(pesel: pesel)) {
    throw InvalidPeselException();
  }

  final century = _getCentury(pesel);
  final year = century.string() + pesel.substring(0, 2);

  var month = pesel.substring(2, 4);

  month = (int.parse(month) - century.monthOffset()).toString();

  // month format - MM
  if (month.length == 1) {
    month = '0$month';
  }

  final day = pesel.substring(4, 6);

  return DateTime.parse('$year-$month-$day');
}

/// returns sex from pesel number
///
/// throws [InvalidPeselException] if pesel number is invalid
Sex? sexFromPesel({
  required String pesel,
}) {
  if (!validatePesel(pesel: pesel)) {
    throw InvalidPeselException();
  }

  if (int.parse(pesel[9]).isEven) {
    return Sex.female;
  } else {
    return Sex.male;
  }
}

/// class that describes the person's sex
enum Sex {
  /// person sex: male
  male,

  /// person sex: female
  female,
}
