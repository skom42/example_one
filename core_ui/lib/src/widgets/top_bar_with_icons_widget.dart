import 'package:core_ui/src/widgets/top_bar_icon_widget.dart';
import 'package:flutter/material.dart';

import '../../core_ui.dart';

class TopBarWithIconsWidget extends StatelessWidget {
  const TopBarWithIconsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TopBarIconWidget(icon: AppIconsTheme.message),
          const SizedBox(width: 16),
          TopBarIconWidget(icon: AppIconsTheme.notification),
        ],
      ),
    );
  }
}
