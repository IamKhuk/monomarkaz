import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monomarkaz/src/theme/app_theme.dart';

class LeadingBack extends StatelessWidget {
  const LeadingBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(44),
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Colors.transparent,
          height: 44,
          width: 44,
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/left.svg',
              color: AppTheme.black,
            ),
          ),
        ),
      ),
    );
  }
}
