import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planee/core/ui/app_color.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.grey.withValues(alpha: 0.15),
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          enableFeedback: false,
          selectedItemColor: AppColor.black,
          unselectedItemColor: AppColor.grey.withValues(alpha: 0.7),
          backgroundColor: AppColor.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
          onTap: navigationShell.goBranch,
        ),
      ),
    );
  }
}
