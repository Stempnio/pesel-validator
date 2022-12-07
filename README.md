# Pesel Validator

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

Dart package for PESEL number validation

### Features:

* Check if given PESEL number is valid
* Extract gender from PESEL
* Extract date of birth from PESEL
* Extract age from PESEL

## Installation 💻

**❗ In order to start using Pesel Validator you must have the [Dart SDK][dart_install_link] installed on your machine.**

Add `pesel_validator` to your `pubspec.yaml`:

```yaml
dependencies:
  pesel_validator: 0.1.0
```

Install it:

```sh
dart pub get
```

---

## Example

See `example/example.dart`

```dart
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
```

[dart_install_link]: https://dart.dev/get-dart
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
