part of 'pesel_validator.dart';

enum _Century {
  eighteenHundreds,
  nineteenHundreds,
  twentyHundreds,
  twentyOneHundreds,
  twentyTwoHundreds,
}

extension _CenturyUtils on _Century {
  String string() {
    switch (this) {
      case _Century.eighteenHundreds:
        return '18';
      case _Century.nineteenHundreds:
        return '19';
      case _Century.twentyHundreds:
        return '20';
      case _Century.twentyOneHundreds:
        return '21';
      case _Century.twentyTwoHundreds:
        return '22';
    }
  }

  int monthOffset() {
    switch (this) {
      case _Century.eighteenHundreds:
        return 80;
      case _Century.nineteenHundreds:
        return 0;
      case _Century.twentyHundreds:
        return 20;
      case _Century.twentyOneHundreds:
        return 40;
      case _Century.twentyTwoHundreds:
        return 60;
    }
  }
}

_Century _getCentury(String pesel) {
  final centuryDigit = int.parse(pesel[2]);

  if (centuryDigit == 8 || centuryDigit == 9) {
    return _Century.eighteenHundreds;
  }

  if (centuryDigit == 0 || centuryDigit == 1) {
    return _Century.nineteenHundreds;
  }

  if (centuryDigit == 2 || centuryDigit == 3) {
    return _Century.twentyHundreds;
  }

  if (centuryDigit == 4 || centuryDigit == 5) {
    return _Century.twentyOneHundreds;
  }

  return _Century.twentyTwoHundreds;
}
