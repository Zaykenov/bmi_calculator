import 'package:flutter/material.dart';

const TextStyle styleText = TextStyle(color: Color(0xFF8D8E98), fontSize: 18);

class ReusableIcon extends StatelessWidget {
  const ReusableIcon(this.icon, this.iconText);

  final IconData icon;
  final String iconText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          iconText,
          style: styleText,
        ),
      ],
    );
  }
}
