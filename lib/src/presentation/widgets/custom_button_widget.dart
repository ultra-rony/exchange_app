import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function onTap;
  final String title;

  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        HapticFeedback.heavyImpact();
        onTap.call();
      },
      child: Text(title),
    );
  }
}
