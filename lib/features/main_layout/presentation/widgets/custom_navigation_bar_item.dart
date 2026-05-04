import 'package:flutter/material.dart';

class CustomNavigationBarItem extends StatelessWidget {
  const CustomNavigationBarItem({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [Icon(icon), Text(label)],
    );
  }
}
