import 'package:flutter/material.dart';

import '../../core_ui.dart';

class HomeStatisticsTextWidget extends StatelessWidget {
  final String title;
  final String description;

  const HomeStatisticsTextWidget({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextTheme.manrope24SemiBold,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextTheme.manrope14Regular.copyWith(
              color: AppTheme.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
