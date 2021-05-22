import 'package:flutter/material.dart';

class LabelCard extends StatelessWidget {
  LabelCard(
      {this.label, this.color, this.width, this.showUpdateButton, this.update});

  final String label;
  final Color color;
  final double width;
  final bool showUpdateButton;
  final Function update;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // width: (width==null)?MediaQuery.of(context).size.width*0.5:MediaQuery.of(context).size.width*width,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 17, color: color, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 400,
                ),
                (showUpdateButton == null)
                    ? SizedBox()
                    : IconButton(
                        onPressed: update,
                        icon: Icon(
                          Icons.edit,
                          color: Colors.teal,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
