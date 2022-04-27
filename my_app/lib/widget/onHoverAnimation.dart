import 'package:flutter/material.dart';

class OnHoverCheckIn extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHoverCheckIn({ Key? key, required this.builder }) : super(key: key);

  @override
  State<OnHoverCheckIn> createState() => _OnHoverCheckInState();
}

class _OnHoverCheckInState extends State<OnHoverCheckIn> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -15, 0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
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