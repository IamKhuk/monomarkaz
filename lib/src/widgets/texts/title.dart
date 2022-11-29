import 'package:flutter/cupertino.dart';
import '../../theme/app_theme.dart';

class Title18 extends StatelessWidget {
  final String text;

  const Title18({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: AppTheme.fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        height: 1.5,
        color: AppTheme.black,
      ),
    );
  }
}