import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool? hasDrawer;
  const AppScaffold({
    super.key,
    required this.body,
    this.hasDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
