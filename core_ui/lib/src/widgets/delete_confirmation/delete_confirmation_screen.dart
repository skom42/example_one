import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class DeleteConfirmationScreen extends StatefulWidget {
  @override
  State<DeleteConfirmationScreen> createState() => _DeleteConfirmationScreenState();
}

class _DeleteConfirmationScreenState extends State<DeleteConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.transparentColor,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppTheme.backgroundPrimaryColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 15),
              Text(
                FlutterI18n.translate(context, 'delete.title'),
                style: AppTextTheme.manrope18Regular.copyWith(
                  color: AppTheme.primaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MainAppButton(
                      text: 'delete.confirm',
                      backgroundColor: AppTheme.buttonBgColor,
                      onPressed: () {
                        AppRouter.of(context).popWithResult(true);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MainAppButton(
                      text: 'delete.cancel',
                      textColor: AppTheme.buttonBgColor,
                      backgroundColor: AppTheme.buttonSecondaryDisabledBgColor,
                      onPressed: () {
                        AppRouter.of(context).popWithResult(false);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
