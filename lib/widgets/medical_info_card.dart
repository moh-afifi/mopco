import 'package:flutter/material.dart';


class MedicalInfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  MedicalInfoCard({
    @required this.text,
    @required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            '0$text',
            style: TextStyle(
              fontSize: 17,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
