import 'package:pesel_validator/pesel_validator.dart';
import 'package:test/test.dart';

const peselsWithBirthDates = {
  '22851768678': '1822-05-17',
  '00410146213': '2100-01-01',
  '82321681683': '2082-12-16',
  '00283128132': '2000-08-31',
  '90050117935': '1990-05-01',
  '01620611669': '2201-02-06'
};

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

    test('sample pesel numbers are valid', () {
      for (final pesel in peselsWithBirthDates.keys) {
        expect(validatePesel(pesel: pesel), true);
      }
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
      for (final el in peselsWithBirthDates.entries) {
        expect(
          dateOfBirthFromPesel(pesel: el.key),
          DateTime.parse(el.value),
        );
      }
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
