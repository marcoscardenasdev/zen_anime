import 'package:intl/intl.dart';

abstract class HumanFormats {
  static String number(int favorites) {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      locale: 'en',
      name: '',
    ).format(favorites);
  }
}
