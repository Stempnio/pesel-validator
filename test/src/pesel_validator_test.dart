import 'package:pesel_validator/pesel_validator.dart';
import 'package:test/test.dart';

void main() {
  group('pesel validation', () {
    test('empty pesel is not valid', () {
      expect(validatePesel(pesel: ''), false);
    });

    test('pesel with non-numeric values is not valid', () {
      expect(validatePesel(pesel: 'A000%000000'), false);
    });

    test('pesel with length not equal to 11 is not valid', () {
      expect(validatePesel(pesel: '123456789'), false);
    });

    test('sample pesel, 02070803628, is valid', () {
      expect(validatePesel(pesel: '02070803628'), true);
    });

    test('sample pesel, 02070803628, with changed control number is invalid',
        () {
      for (var i = 0; i < 10 && i != 8; i++) {
        expect(validatePesel(pesel: '0207080362$i'), false);
      }
    });
  });

  group('getting date of birth from pesel', () {
    test('invalid pesel throws InvalidPeselException', () {
      expect(
        () => dateOfBirthFromPesel(pesel: ''),
        throwsA(isA<InvalidPeselException>()),
      );
    });

    test('valid pesel returns correct date of birth', () {
      expect(
        dateOfBirthFromPesel(pesel: '02070803628'),
        DateTime.parse('1902-07-08'),
      );
    });
  });

  group('getting age from pesel', () {
    test('invalid pesel throws InvalidPeselException', () {
      expect(
        () => ageFromPesel(pesel: ''),
        throwsA(isA<InvalidPeselException>()),
      );
    });

    test('valid pesel returns correct age', () {
      expect(
        ageFromPesel(pesel: '02070803628'),
        DateTime.now().difference(DateTime.parse('1902-07-08')).inDays ~/ 365,
      );
    });
  });

  group('getting sex from pesel', () {
    test('invalid pesel throws InvalidPeselException', () {
      expect(
        () => sexFromPesel(pesel: ''),
        throwsA(isA<InvalidPeselException>()),
      );
    });

    test('valid pesel returns correct sex (in this example female)', () {
      expect(
        sexFromPesel(pesel: '02070803628'),
        Sex.female,
      );
    });

    test('valid pesel returns correct sex (in this example male)', () {
      expect(
        sexFromPesel(pesel: '90090515836'),
        Sex.male,
      );
    });
  });
}
