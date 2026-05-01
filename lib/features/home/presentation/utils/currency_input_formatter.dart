import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final _currencyFormat = NumberFormat.currency(
    locale: "ID",
    symbol: "",
    decimalDigits: 0,
  );
  String? pointNumber;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll(".", "");
    final number = int.tryParse(newText) ?? 0;
    final value = _currencyFormat.format(number);
    return newValue.copyWith(
      text: value,
      selection: .collapsed(offset: value.length),
    );
  }
}
