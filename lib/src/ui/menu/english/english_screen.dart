import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class EnglishScreen extends StatefulWidget {
  const EnglishScreen({Key? key}) : super(key: key);

  @override
  State<EnglishScreen> createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<EnglishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Center(
        child: Text("Courses Screen"),
      ),
    );
  }
}
