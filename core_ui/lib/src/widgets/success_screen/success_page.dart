import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/widgets/success_screen/success_screen.dart';
import 'package:flutter/material.dart';

class SuccessFeature {
  static Page<void> page() {
    return _SuccessPage();
  }
}

class _SuccessPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return BottomSlideRoute<void>(
      customHeight: MediaQuery.of(context).size.height * 0.79,
      settings: this,
      builder: (_) {
        return const SuccessScreen();
      },
    );
  }
}
