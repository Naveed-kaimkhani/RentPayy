
import 'package:flutter/material.dart';

import '../utils/style/Images.dart';

class or_line_widget extends StatelessWidget {
  const or_line_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Images.line),
          Text("Or"),
          Image.asset(Images.line),
        ],
      ),
    );
  }
}
