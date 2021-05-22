import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile({this.icon, this.label, this.onTap,this.textColor});

  final Function onTap;
  final String label;
  final IconData icon;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        label,
        style: TextStyle(
            fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        icon,
        color: Colors.black,
        size: 35,
      ),
    );
  }
}
