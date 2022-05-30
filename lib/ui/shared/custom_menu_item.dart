import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({
    Key? key, 
    required this.text, 
    required this.onTap, 
    this.delay = 0,
  }) : super(key: key);

  final String text;
  final GestureTapCallback? onTap;
  final int delay;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10.0,
      delay: Duration(milliseconds: widget.delay),
      duration: const Duration(milliseconds: 200),
      child: MouseRegion(
        onEnter: (event) => setState(() {isHover = true;}),
        onExit: (event) => setState(() {isHover = false;}),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 150.0,
            height: 50.0,
            color: isHover ? Colors.pinkAccent : Colors.transparent,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}