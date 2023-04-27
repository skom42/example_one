import 'package:flutter/material.dart';

import '../../core_ui.dart';

class TopBarIconWidget extends StatelessWidget {
  final AppIcon icon;

  const TopBarIconWidget({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundPrimaryColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(12),
      child: icon.call(size: 18),
    );
  }
}
