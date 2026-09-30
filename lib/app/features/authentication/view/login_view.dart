import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:school_sys/app/core/values/app_colors.dart';
import 'package:school_sys/app/core/values/text_styles.dart';
import '../../dashboard/view/dashboard_view.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../widgets/user_toggle_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bloc = context.read<LoginBloc>();

          return Scaffold(
            backgroundColor: state.userType == "Parents"
                ? Color(0xFFFFCE00) // yellow for parents
                : Color(0xFFFFFFFF), // white for students
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 60,),

                      SizedBox(height: 36),
                      Text(
                        "Sign in to your account",
                        style: black14_500
                      ),
                      SizedBox(height: 28),

                      /// Toggle between Student and Parent
                       UserTypeToggle(
                          selected: state.userType,
                          onChanged: (type) => bloc.add(UserTypeChanged(type)),
                        ),


                      SizedBox(height: 32),

                      /// Student ID or Mobile Number Field
                      TextField(style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.grey),
                        cursorColor: AppColors.appBarColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Image.asset(
                            'assets/images/circle-user (2) 1.png',
                            scale: 4,
                          ),
                          hintText: state.userType == "Parents"
                              ? "Mobile Number"
                              : "Student ID",
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: AppColors.borderColor),
                          ),
                        ),
                        onChanged: (value) => bloc.add(
                            LoginCredentialsChanged(value, state.password)),
                      ),

                      SizedBox(height: 22),

                      /// Password Field with toggle icon
                      TextField(
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.grey),
                        obscureText: !state.isPasswordVisible,
                        cursorColor: AppColors.appBarColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Image.asset('assets/images/lock 1.png',
                              scale: 4),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                            onPressed: () =>
                                bloc.add(LoginPasswordVisibilityToggled()),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: AppColors.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: AppColors.borderColor),
                          ),
                        ),
                        onChanged: (value) => bloc.add(
                            LoginCredentialsChanged(state.studentId, value)),
                      ),
                      SizedBox(height: 12,),
                      /// Remember Me
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 22,height: 22,
                            child: Checkbox(
                                  // side: BorderSide(strokeAlign:1,width: 1,),
                                activeColor: AppColors.appBarColor,
                                value: state.rememberMe,
                                onChanged: (_) => bloc.add(RememberMeToggled()),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                          ),
                          SizedBox(width: 8,),
                          Text("Remember me",style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xff565656),fontSize: 12),)
                        ],
                      ),
                      SizedBox(height: 22),
                      /// Sign In Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appBarColor,
                          foregroundColor: Colors.white,
                          minimumSize: Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          bloc.add(SubmitLogin());
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DashboardScreen()),
                          );
                        },
                        child: state.isSubmitting
                            ?LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.appBarColor,
                          size: 40,
                        )
                            : Text("Sign In"),
                      ),

                      if (state.error != null) ...[
                        SizedBox(height: 10),
                        Text(
                          state.error!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ],

                      SizedBox(height: 16),

                      /// Forgot Password
                      TextButton(
                        onPressed: () {},
                        child: Text.rich(
                          TextSpan(
                            text: "Forgot Password? ",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400,fontSize: 10),
                            children: [
                              TextSpan(
                                text: "Contact STAD",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 16),
                      /// Privacy Statement
                      Text(
                        "By continuing you acknowledge that your personal data will be processed in accordance with the Privacy Statement.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, color: Colors.grey,fontWeight: FontWeight.w400),
                      ),

                      SizedBox(height: 40),

                      /// Footer
                      Text("© mPair", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


