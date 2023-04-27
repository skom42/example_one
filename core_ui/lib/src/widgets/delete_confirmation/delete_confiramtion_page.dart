import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'delete_confirmation_screen.dart';

class DeleteConfirmation {
  static Page<bool?> page() {
    return _DeleteConfirmationPage();
  }
}

class _DeleteConfirmationPage extends Page<bool?> {
  @override
  Route<bool?> createRoute(BuildContext context) {
    return BottomSlideRoute<bool?>(
      customHeight: MediaQuery.of(context).size.height * 0.78,
      settings: this,
      builder: (_) {
        return DeleteConfirmationScreen();
      },
    );
  }
}
