import 'package:flutter/material.dart';
import 'package:masante228/screens/provider/page_provider.dart';
import 'package:masante228/utils/screens_utils.dart';
import 'package:masante228/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesToWidget[context.watch<PageProvider>().page]!,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
