import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  Widget mobileLayout;
  Widget webLayout;

  ResponsiveLayout({
    required this.mobileLayout,
    required this.webLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < 1050) {
          return mobileLayout;
        } else {
          return webLayout;
        }
      }),
    );
  }
}
