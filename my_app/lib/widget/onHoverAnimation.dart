import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class OnHoverCheckIn extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  final double x;
  final double y;
  final double z;
  const OnHoverCheckIn({ Key? key, required this.builder, required this.x, required this.y, required this.z }) : super(key: key);

  @override
  State<OnHoverCheckIn> createState() => _OnHoverCheckInState();
}

class _OnHoverCheckInState extends State<OnHoverCheckIn> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    widget.x;
    widget.y;
    widget.z;
    final hoveredTransform = Matrix4.identity()..translate(widget.x, widget.y, widget.z);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Sprung.overDamped,
        transform: transform,
        child: widget.builder(isHovered)
      )
    );
  }

  void onEntered(bool isHovered) => 
    setState(() {
      this.isHovered = isHovered;
    });
}
