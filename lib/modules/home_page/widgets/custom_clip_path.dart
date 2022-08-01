import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path>{
  final double margin;
  CustomClipPath({this.margin=0.0});
  @override
  Path getClip(Size size) {
    final path=Path();
    final h=size.height;
    final w=size.width;
    path.lineTo(0, (h-30)-margin);
    path.quadraticBezierTo(w*0.1, h-margin, (w*0.3)-margin, h-margin);
    path.quadraticBezierTo(w*0.8, h-margin, (w*0.9)-margin, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}