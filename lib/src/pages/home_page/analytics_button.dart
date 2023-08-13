import 'package:flutter/material.dart';

class AnalyticsButton extends StatelessWidget {
  const AnalyticsButton({
    super.key,
    required this.onPress,
    required this.label,
  });

  final VoidCallback onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
