// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DashboardHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xffB1CEBF);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.3, size.height, size.width * 0.6, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.9, size.height *0.3, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);


    paint.color = const Color(0xffF5F5F5);
    paint.style = PaintingStyle.stroke;

    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.3, size.height, size.width * 0.6, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.9, size.height *0.3, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}