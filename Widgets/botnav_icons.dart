import 'package:flutter/material.dart';

import 'customtext.dart';

class BotNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function function;

  const BotNavIcon({Key key, this.image, this.name, this.function}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: function ?? null,
              child: Column(
          children: <Widget>[
            Image.asset('Images/$image',width: 20.0,height: 20.0,),
            SizedBox(height: 2.0),
            CustomText(text: name)
          ],
        ),
      ),
    );
  }
}
