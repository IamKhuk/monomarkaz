import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monomarkaz/src/dialog/bottom_dialog.dart';
import 'package:monomarkaz/src/model/course_model.dart';
import 'package:monomarkaz/src/theme/app_theme.dart';
import 'dart:io';
import '../../widgets/container/leading_main.dart';
import '../../widgets/texts/text_form_text.dart';

class RegisterScreen extends StatefulWidget {
  final CourseModel course;

  const RegisterScreen({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 60,
        leading: const LeadingBack(),
        centerTitle: true,
        title: const Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                      top: 22,
                      left: 24,
                      right: 24,
                      bottom: 92,
                    ),
                    children: [
                      const TextFormText(text: 'Course Name'),
                      const SizedBox(height: 12),
                      Container(
                        height: 44,
                        width: MediaQuery.of(context).size.width - 32,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppTheme.lightTwo,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 75,
                              spreadRadius: 0,
                              color: const Color(0xFF939393).withOpacity(0.07),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/collection.svg',
                              height: 16,
                              width: 16,
                              color: AppTheme.blue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.course.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: AppTheme.fontFamily,
                                color: AppTheme.black,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TextFormText(text: 'First Name'),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppTheme.lightTwo,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 75,
                              spreadRadius: 0,
                              color: const Color(0xFF939393).withOpacity(0.07),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          enabled: true,
                          controller: firstNameController,
                          enableSuggestions: true,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: AppTheme.blue,
                          enableInteractiveSelection: true,
                          style: const TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppTheme.black,
                          ),
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your first name',
                            hintStyle: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: AppTheme.gray,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TextFormText(text: 'Last Name'),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppTheme.lightTwo,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 75,
                              spreadRadius: 0,
                              color: const Color(0xFF939393).withOpacity(0.07),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          enabled: true,
                          controller: lastNameController,
                          enableSuggestions: true,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: AppTheme.blue,
                          enableInteractiveSelection: true,
                          style: const TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppTheme.black,
                          ),
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your last name',
                            hintStyle: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: AppTheme.gray,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TextFormText(text: 'Phone Number'),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppTheme.lightTwo,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 75,
                              spreadRadius: 0,
                              color: const Color(0xFF939393).withOpacity(0.07),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          enabled: true,
                          controller: phoneNameController,
                          enableSuggestions: true,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: AppTheme.blue,
                          enableInteractiveSelection: true,
                          style: const TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppTheme.black,
                          ),
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: AppTheme.gray,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const TextFormText(text: 'Address'),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppTheme.lightTwo,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 75,
                              spreadRadius: 0,
                              color: const Color(0xFF939393).withOpacity(0.07),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          enabled: true,
                          controller: addressNameController,
                          enableSuggestions: true,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: AppTheme.blue,
                          enableInteractiveSelection: true,
                          style: const TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                            color: AppTheme.black,
                          ),
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your address',
                            hintStyle: TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              color: AppTheme.gray,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    BottomDialog.showSuccess(context);
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
      ),
    );
  }
}
