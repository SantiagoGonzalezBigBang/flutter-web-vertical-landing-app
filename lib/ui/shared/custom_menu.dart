import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_app/providers/providers.dart';

import 'package:vertical_landing_app/ui/shared/shared.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({Key? key}) : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> with SingleTickerProviderStateMixin {

  bool isOpen = false;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200)
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen = !isOpen;
          if (isOpen) {
            animationController.forward(from: 0.0);
          } else {
            animationController.reverse(from: 1.0);
          }
          setState(() {});
        },
        child: Container(
          width: 150.0,
          height: isOpen ? 308 : 50.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(
                isOpen: isOpen, 
                animationController: animationController
              ),
              if (isOpen) ...[
                CustomMenuItem(text: 'Home'    , onTap: () => screenProvider.goTo(0), delay: 0,),
                CustomMenuItem(text: 'About'   , onTap: () => screenProvider.goTo(1), delay: 30,),
                CustomMenuItem(text: 'Pricing' , onTap: () => screenProvider.goTo(2), delay: 60,),
                CustomMenuItem(text: 'Contact' , onTap: () => screenProvider.goTo(3), delay: 90,),
                CustomMenuItem(text: 'Location', onTap: () => screenProvider.goTo(4), delay: 120,),
                const SizedBox(height: 8.0,)
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {

  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.animationController,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 50.0,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 43.0 : 0.0,                
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18.0
            ),
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: Colors.white,
            progress: animationController,
          ),
        ],
      ),
    );
  }
}