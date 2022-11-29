import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../defaults/defaults.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/container/course_container.dart';
import '../../../widgets/texts/title.dart';
import 'course_details_screen.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: AppTheme.bg,
        elevation: 0,
        centerTitle: true,
        title: Title18(text: translate("course.our_courses")),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        padding: const EdgeInsets.only(
          top: 22,
          left: 24,
          right: 24,
          bottom: 92,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CourseDetailsScreen(
                            course: courses[index],
                          );
                        },
                      ),
                    );
                  },
                  child: CourseContainer(data: courses[index])),
              index == courses.length - 1
                  ? Container()
                  : const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
