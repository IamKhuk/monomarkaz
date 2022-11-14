import 'package:monomarkaz/src/model/teacher_model.dart';

class CourseModel {
  String image;
  String name;
  String text;
  TeacherModel teacher;
  List<String> images;

  CourseModel({
    required this.image,
    required this.name,
    this.text = "Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz. Biz sizni monomarkazning Beginner va Elementary guruhlarida o'qishga taklif etamiz.",
    required this.teacher,
    this.images = const [
      'assets/images/news_01.jpg',
      'assets/images/news_02.jpg',
      'assets/images/news_03.jpg',
    ],
  });
}
