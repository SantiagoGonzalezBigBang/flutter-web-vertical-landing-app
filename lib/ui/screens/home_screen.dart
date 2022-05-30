import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:vertical_landing_app/providers/providers.dart';
import 'package:vertical_landing_app/ui/shared/shared.dart';
import 'package:vertical_landing_app/ui/views/views.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({
    Key? key
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Container(
        decoration: _buildBoxDecoration(),
        child: Stack(
          children: const [
            _HomeBody(),
            Positioned(
              right: 20.0,
              top: 20.0,
              child: CustomMenu()
            )
          ],
        ),
      )
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.pink,
          Colors.purpleAccent
        ],        
        stops: [
          0.5,
          0.5
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )  
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return PageView(
      controller: screenProvider.pageController,
      scrollDirection: Axis.vertical,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        }
      ),
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}