import 'package:customer/view/components/app-bar/custom_appbar.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Select your Location",
      ),
      body: SingleChildScrollView(child: Container()),
    );
  }
}
