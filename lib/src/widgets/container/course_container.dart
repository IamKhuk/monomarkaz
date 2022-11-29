import 'package:flutter/cupertino.dart';
import 'package:monomarkaz/src/model/course_model.dart';

import '../../theme/app_theme.dart';

class CourseContainer extends StatelessWidget {
  final CourseModel data;

  const CourseContainer({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 48,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 20,
            spreadRadius: 0,
            color: AppTheme.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 164,
            width: MediaQuery.of(context).size.width - 80,
            decoration: BoxDecoration(
              color: AppTheme.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            data.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: AppTheme.fontFamily,
              fontSize: 16,
              color: AppTheme.black,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.text,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: AppTheme.fontFamily,
              fontSize: 12,
              color: AppTheme.black,
              letterSpacing: 0.5,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
