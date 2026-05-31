import 'package:flutter/material.dart';

extension ChangeRateIcon on String {
  Widget get setChangeRateIcon {
    if (contains("-")) {
      return const Icon(Icons.trending_down, color: Colors.red);
    } else if (startsWith("0.00%")) {
      return const Icon(Icons.trending_flat, color: Colors.green);
    } else {
      return const Icon(Icons.trending_up, color: Colors.green);
    }
  }
}
