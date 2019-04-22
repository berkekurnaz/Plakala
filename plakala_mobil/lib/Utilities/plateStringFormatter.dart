import 'package:flutter/services.dart';

class PlateStringFormatter extends TextInputFormatter {
  
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.trim().replaceAll(" ", ""));
  }
  
}