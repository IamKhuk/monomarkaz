import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monomarkaz/src/ui/menu/course/courses_screen.dart';
import 'package:monomarkaz/src/ui/menu/english/english_screen.dart';
import 'package:monomarkaz/src/ui/menu/study_abroad/study_abroad_screen.dart';
import '../../theme/app_theme.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> data = [
    const HomeScreen(),
    const CoursesScreen(),
    const EnglishScreen(),
    const StudyAbroadScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Stack(
        children: [
          data[selectedIndex],
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              height: 56,
              width: size.width-48,
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(56),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: AppTheme.dark.withOpacity(0.1),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(
                left: 24,
                bottom: 24,
                right: 24,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home.svg',
                            color: selectedIndex == 0
                                ? AppTheme.blue
                                : AppTheme.light,
                          ),
                          selectedIndex == 0
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/schedule.svg',
                            color: selectedIndex == 1
                                ? AppTheme.blue
                                : AppTheme.light,
                          ),
                          selectedIndex == 1
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/monitor.svg',
                            color: selectedIndex == 2
                                ? AppTheme.blue
                                : AppTheme.light,
                          ),
                          selectedIndex == 2
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    borderRadius: BorderRadius.circular(36),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/feedback.svg',
                            color: selectedIndex == 3
                                ? AppTheme.blue
                                : AppTheme.light,
                          ),
                          selectedIndex == 3
                              ? Column(
                            children: [
                              const SizedBox(height: 4),
                              Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppTheme.blue,
                                ),
                              ),
                            ],
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}