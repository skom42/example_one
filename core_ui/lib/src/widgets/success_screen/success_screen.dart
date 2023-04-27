import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    autoClose();
  }

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
              const SizedBox(height: 30),
              Text(
                FlutterI18n.translate(context, 'success.title'),
                style: AppTextTheme.manrope30SemiBold.copyWith(color: AppTheme.primaryTextColor),
              ),
              const SizedBox(height: 4),
              Text(
                FlutterI18n.translate(context, 'success.description'),
                style: AppTextTheme.manrope18Regular.copyWith(color: AppTheme.primaryTextColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> autoClose() async {
    const Duration duration = Duration(seconds: 2);
    await Future.delayed(
      duration,
      () => AppRouter.of(context).pop(),
    );
  }
}
