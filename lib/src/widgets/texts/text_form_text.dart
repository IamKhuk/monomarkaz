import 'package:flutter/cupertino.dart';

import '../../theme/app_theme.dart';

class TextFormText extends StatelessWidget {
  final String text;
  final Color color;

  const TextFormText({
    Key? key,
    required this.text,
    this.color = AppTheme.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          text,
          style: TextStyle(
            fontFamily: AppTheme.fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: color,
          ),
        ),
      ],
    );
  }
}