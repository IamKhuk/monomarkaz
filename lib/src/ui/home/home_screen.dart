import 'package:flutter/material.dart';

import '../../defaults/defaults.dart';
import '../../theme/app_theme.dart';
import '../../widgets/container/course_container.dart';
import 'course_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        actions: [],
        elevation: 0,
        backgroundColor: AppTheme.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 28,
            ),
            decoration: BoxDecoration(
              color: AppTheme.blue,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
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
              children: const [
                Text(
                  "Hi, welcome to",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 16,
                    color: AppTheme.white,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Monomarkaz",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 20,
                    color: AppTheme.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(
                top: 22,
                left: 24,
                right: 24,
                bottom: 24,
              ),
              children: [
                const Text(
                  "Our Courses",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.fontFamily,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  itemCount: courses.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
