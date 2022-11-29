import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class StudyAbroadScreen extends StatefulWidget {
  const StudyAbroadScreen({Key? key}) : super(key: key);

  @override
  State<StudyAbroadScreen> createState() => _StudyAbroadScreenState();
}

class _StudyAbroadScreenState extends State<StudyAbroadScreen> {
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
