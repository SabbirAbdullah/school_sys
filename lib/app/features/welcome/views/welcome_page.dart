import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_styles.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import 'copyright_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0,backgroundColor: Color(0xffe6f9ff),),
      body:  Container(
          height: double.infinity,width: double.infinity,
          decoration: BoxDecoration(gradient: AppColors.appBackgroundColor),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight*.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: screenHeight * 0.35,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Please Login to continue",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                          child: Container(
                            width: 289,
                            height: 50,
                            child: TextButton(
                              onPressed: (){},
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row( mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(('assets/images/vector_student.svg'),),
                                  SizedBox(width: 10,),
                                  Text(
                                      "Student Login",
                                      style: whiteText16
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                          child: Container(
                            width: 289,
                            height: 50,
                            child: TextButton(
                              onPressed: (){},
                              style: TextButton.styleFrom(
                                backgroundColor: AppColors.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset( ('assets/images/vactor_parents.svg')),
                                  SizedBox(width: 10,),
                                  Text(
                                      "Parent Login",
                                      style: whiteText16
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                CopyrightText()
              ],
            ),
        ),
    );
  }
}
