import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:user_profile/src/ui/user_profile_form.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundPrimaryColor,
      body: const UserProfileForm(),
    );
  }
}
