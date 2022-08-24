import 'package:flutter/material.dart';

import 'package:onfonapp/constants/color.dart';

class CustomSphere extends StatelessWidget {
  final double width;
  final double height;
  const CustomSphere({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            circlePurpleDark,
            circlePurpleLight,
          ],
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
