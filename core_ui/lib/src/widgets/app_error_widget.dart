import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final Function onPageReload;

  const AppErrorWidget({
    required this.onPageReload,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          FlutterI18n.translate(context, 'error.title'),
          style: AppTextTheme.manrope22SemiBold
              .copyWith(color: AppTheme.primaryTextColor),
        ),
        const SizedBox(height: 8),
        Text(
          FlutterI18n.translate(context, 'error.description'),
        ),
        const SizedBox(height: 20),
        MainAppButton(
          height: 40,
          text: FlutterI18n.translate(context, 'error.button'),
          backgroundColor: AppTheme.buttonBgColor,
          onPressed: () {
            onPageReload();
          },
        )
      ],
    );
  }
}
