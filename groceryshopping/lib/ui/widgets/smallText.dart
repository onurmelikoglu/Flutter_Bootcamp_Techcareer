import 'package:flutter/material.dart';

class smallText extends StatelessWidget {

  String text;
  double fontsize;
  FontWeight fontweight;
  Color color;
  int maxlines;
  TextAlign textAlign;


  smallText({
    required this.text,
    required this.fontsize,
    this.fontweight = FontWeight.w400,
    this.maxlines = 1,
    this.textAlign = TextAlign.start,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: maxlines,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontFamily: 'Inter', fontSize:fontsize, fontWeight: fontweight, color: color )
    );
  }
}
