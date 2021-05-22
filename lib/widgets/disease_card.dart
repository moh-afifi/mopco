import 'package:flutter/material.dart';
import 'package:mopco/widgets/label_card.dart';

class DiseaseCard extends StatelessWidget {
  DiseaseCard({this.from,this.to,this.fromCut,this.toCut,this.numOfDays});
  final String from,to,fromCut,toCut,numOfDays;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(children: [
        LabelCard(label: 'عدد الايام: $numOfDays',color: Colors.pink),
        LabelCard(label: 'من : $from',color: Color(0xFF1E4F6F),),
        LabelCard(label: 'إلى : $to',color: Color(0xFF1E4F6F),),
        LabelCard(label: 'تم خصمها عن الفترة من : $fromCut',color: Color(0xFF1E4F6F),),
        LabelCard(label: 'تم خصمها عن الفترة الى : $toCut',color: Color(0xFF1E4F6F),),
      ],),
    );
  }
}
