import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class CurrencyIndonesiaInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return const TextEditingValue(
        text: '0',
        selection: TextSelection.collapsed(offset: 1),
      );
    } else if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var newNumberValue = double.parse(newValue.text.replaceAll(',', '').replaceAll('.', ''));
    final formatter = NumberFormat('#,###');
    final newText = formatter.format(newNumberValue).replaceAll(',', '.');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}