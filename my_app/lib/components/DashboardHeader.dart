// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DashboardHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xffbbdbca);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.3, size.height, size.width * 0.6, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.9, size.height * 0.3, size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);

    var paint2 = Paint();
    paint2.color = const Color(0xffcce3d7);
    paint2.style = PaintingStyle.fill;

    var path2 = Path();

    path2.moveTo(0, size.height * 0.6);
    path2.quadraticBezierTo(
        size.width * 0.3, size.height, size.width * 0.6, size.height * 0.7);
    path2.quadraticBezierTo(
        size.width * 0.9, size.height * 0.6, size.width, size.height * 0.6);
    path2.lineTo(size.width, size.height * 0.5);
    path2.quadraticBezierTo(size.width * 0.9, size.height * 0.3,
        size.width * 0.6, size.height * 0.65);
    path2.quadraticBezierTo(
        size.width * 0.3, size.height, 0, size.height * 0.5);

    canvas.drawPath(path2, paint2);

    var paint3 = Paint();
    paint3.color = const Color(0xffd7e7df);
    paint3.style = PaintingStyle.fill;

    var path3 = Path();

    path3.moveTo(0, size.height * 0.7);
    path3.quadraticBezierTo(
        size.width * 0.3, size.height, size.width * 0.6, size.height * 0.8);
    path3.quadraticBezierTo(
        size.width * 0.9, size.height * 0.6, size.width, size.height * 0.7);
    path3.lineTo(size.width, size.height * 0.6);
    path3.quadraticBezierTo(size.width * 0.9, size.height * 0.4,
        size.width * 0.6, size.height * 0.7);
    path3.quadraticBezierTo(
        size.width * 0.3, size.height, 0, size.height * 0.6);

    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
