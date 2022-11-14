import 'package:monomarkaz/src/model/teacher_model.dart';

import '../model/course_model.dart';

List<CourseModel> courses = [
  CourseModel(
    image: "assets/images/news_05.jpg",
    name: "Kadrlar bo'yicha inspektor",
    teacher: TeacherModel(
      firstName: "Erali",
      lastName: "Choriyev",
    ),
  ),
  CourseModel(
    image: "assets/images/news_04.jpg",
    name: "Kompyuter savodxonligi",
    teacher: TeacherModel(
      firstName: "Xusan",
      lastName: "Xukumov",
    ),
  ),
  CourseModel(
    image: "assets/images/news_03.jpg",
    name: "Web dasturlash",
    teacher: TeacherModel(
      firstName: "Ramziddin",
      lastName: "Rustamov",
    ),
  ),
  CourseModel(
    image: "assets/images/news_02.jpg",
    name: "O\'rta malakali buxgalteriya",
    teacher: TeacherModel(
      firstName: "Diyorjon",
      lastName: "Xasanov",
    ),
  ),
  CourseModel(
    image: "assets/images/news_01.jpg",
    name: "Tikuvchilik",
    teacher: TeacherModel(
      firstName: "Abulqosim",
      lastName: "Rafiqov",
    ),
  ),
];
