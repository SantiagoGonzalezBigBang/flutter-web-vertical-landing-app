import 'package:flutter/material.dart';

import 'package:universal_html/html.dart' as html;


class ScreenProvider extends ChangeNotifier {

  PageController pageController = PageController();

  final List<String> _screens = const [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  int _currentIndex = 0;

  createPageController(String routeName) {
    pageController = PageController(
      initialPage: getPageIndex(routeName)
    );
    html.document.title = _screens[getPageIndex(routeName)];

    pageController.addListener(() {
      final index = (pageController.page ?? 0).round();
      if (index != _currentIndex) {        
        html.window.history.pushState(null, 'none', '#/${_screens[index]}');
        html.document.title = _screens[index];
        _currentIndex = index;
      } 
    });
  }

  int getPageIndex(String routeName) {
    return !_screens.contains(routeName) ? 0 : _screens.indexOf(routeName);
  }


  goTo(int index) {

    // html.window.history.pushState(null, 'none', '#/${_screens[index]}');

    pageController.animateToPage(
      index, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut
    );
  }

}