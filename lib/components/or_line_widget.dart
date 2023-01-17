
import 'package:flutter/material.dart';
class or_line_widget extends StatelessWidget {
  const or_line_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                child: Divider(
                  color: Colors.black,
                  height: 50,
                )),
          ),
          Text("Or"),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                child: Divider(
                  color: Colors.black,
                  height: 50,
                )),
          ),
        ],
      ),
    );
  }
}
