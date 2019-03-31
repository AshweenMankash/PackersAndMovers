import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final title;
  InfoWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.0),),
      ),
    );
  }
}
