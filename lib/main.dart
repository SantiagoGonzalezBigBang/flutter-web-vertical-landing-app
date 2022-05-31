import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vertical_landing_app/providers/providers.dart';
import 'package:vertical_landing_app/routes/routes.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenProvider(),)  
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {    
    super.initState();
    Routes.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vertical Landing',
      initialRoute: '/home',
      onGenerateRoute: Routes.fluroRouter.generator,
    );
  }
}