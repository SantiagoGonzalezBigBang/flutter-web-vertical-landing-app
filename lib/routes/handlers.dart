import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_app/providers/providers.dart';

import 'package:vertical_landing_app/ui/screens/screens.dart';

final homeHandler = Handler(
  handlerFunc: (context, parameters) {
    final routeName = parameters['page']!.first;

    if (routeName != '/') {
      final screenProvider = Provider.of<ScreenProvider>(context!, listen: false);
      screenProvider.createPageController(routeName);
      
      return const HomeScreen();
    }

    return null;
  },  
);