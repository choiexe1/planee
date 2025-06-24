import 'package:flutter/material.dart';
import 'package:planee/presentation/screens/settings/settings_screen.dart';

class SettingsScreenRoot extends StatefulWidget {
  const SettingsScreenRoot({super.key});
  @override
  State<StatefulWidget> createState() => _SettingsScreenRootState();
}

class _SettingsScreenRootState extends State<SettingsScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return SettingsScreen();
  }
}
