import 'package:flutter/material.dart';
import 'package:mental_health_app/res/colors.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.textColor,
      foregroundColor: AppColors.customblue,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
