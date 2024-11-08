import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  const ResponsiveLayout({required this.mobileBody, required this.desktopBody, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
     builder: (context, constraints) {
       return constraints.maxWidth < 992 ? mobileBody : desktopBody;
     }
    );
  }
}