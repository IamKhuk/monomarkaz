class TeacherModel {
  String avatar;
  String firstName;
  String lastName;
  String bio;
  String phoneNumber;
  String email;

  TeacherModel({
    this.avatar = 'assets/images/teacher_01.jpg',
    required this.firstName,
    required this.lastName,
    this.bio = "English teacher with 5 years of solid experience",
    this.email='monomarkaz_teacher@gmail.com',
    this.phoneNumber = '+998977977797',
  });
}
