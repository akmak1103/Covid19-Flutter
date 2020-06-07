import 'package:flutter/material.dart';

import '../helpers.dart';

class MainCard{
  static Card card(color,title,titleSize,value,valueSize){
    return Card(
        color: color,
        shadowColor: color,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: UIHelpers.cardTitle(
                    titleSize*0.030),
              ),
              UIHelpers.verticalBox(6.0),
              Text(
                value,
                style: UIHelpers.cardData(
                    valueSize*0.035),
              )
            ],
          ),
        ));
  }
}