import 'package:flutter/material.dart';
import 'const.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    required this.icon,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0, color: Colors.white,),
        const SizedBox(height: 15.0,),
        Text(label, style: kLabelTextStyle,),
      ],
    );
  }
}
