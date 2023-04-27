import 'package:core_ui/core_ui.dart';
import 'package:dashboard/src/ui/dashboard_form.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrimaryColor,
      body: const SafeArea(
        child: DashboardForm(),
      ),
    );
  }
}
