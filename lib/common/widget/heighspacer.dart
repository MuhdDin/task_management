import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({
    super.key,
    required this.hieght,
  });

  final double hieght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hieght,
    );
  }
}
