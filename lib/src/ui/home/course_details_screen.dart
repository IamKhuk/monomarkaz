import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:monomarkaz/src/model/course_model.dart';
import 'package:monomarkaz/src/theme/app_theme.dart';
import 'dart:io';

import 'package:monomarkaz/src/ui/home/register_screen.dart';

class CourseDetailsScreen extends StatefulWidget {
  final CourseModel course;

  const CourseDetailsScreen({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool onReadFull = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 252,
                child: Image.asset(
                  widget.course.image,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 220),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 28,
                        left: 24,
                        right: 24,
                        bottom: 92,
                      ),
                      decoration: const BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.course.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 18,
                              color: AppTheme.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.course.text,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: AppTheme.fontFamily,
                                    color: AppTheme.gray,
                                  ),
                                  maxLines: onReadFull == false ? 12 : 999,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    onReadFull = !onReadFull;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  color: Colors.transparent,
                                  child: Text(
                                    onReadFull == false
                                        ? translate("location.read_more")
                                        : translate("location.less"),
                                    style: const TextStyle(
                                      fontFamily: AppTheme.fontFamily,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5,
                                      color: AppTheme.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Images",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.black,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 144,
                            child: ListView.builder(
                              itemCount: widget.course.images.length,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(right: 8),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      height: 144,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          widget.course.images[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    index == widget.course.images.length - 1
                                        ? Container()
                                        : const SizedBox(width: 16),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * ((94) / 812),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.only(
                              left: 4,
                              top: 8,
                              bottom: 8,
                              right: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/left.svg',
                                height: 24,
                                width: 24,
                                color: AppTheme.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen(course: widget.course);
                      },
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  width: MediaQuery.of(context).size.width - 48,
                  margin: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: Platform.isIOS ? 32 : 24,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.blue,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: AppTheme.black.withOpacity(0.07),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppTheme.fontFamily,
                        color: AppTheme.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
