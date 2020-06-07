import 'package:flutter/material.dart';
import '../helpers.dart';

class Header{
  static header(model,mediaQuery){
    return ClipPath(

      //to create the curve
      clipper: MyClipper(),

      child: Container(
        padding: EdgeInsets.all(15),
        height: 200,
        width: double.infinity,

        //background Gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF17172E),
              Colors.black87,
            ],
          ),

          //background Image
          image: DecorationImage(
            image: AssetImage("assets/virus.png"),
          ),
        ),

        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              //to display refresh icon at the right side
              mainAxisAlignment: MainAxisAlignment.end,

              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //refresh the page -- fetch data again from the internet
                    model.getStateWiseStats();
                  },
                  child: Icon(
                    Icons.refresh,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            UIHelpers.verticalBox(mediaQuery.height*0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('COVID-19',style:UIHelpers.titleStyle(60.0))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}