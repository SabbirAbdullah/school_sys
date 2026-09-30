class LoginState {
  final String userType; // "Student" or "Parents"
  final String studentId;
  final String password;
  final bool rememberMe;
  final bool isSubmitting;
  final String? error;
  final bool isPasswordVisible;


  LoginState({
    this.userType = "Student",
    this.studentId = "",
    this.password = "",
    this.rememberMe = false,
    this.isSubmitting = false,
    this.error,
    this.isPasswordVisible = false,
  });

  LoginState copyWith({
    String? userType,
    String? studentId,
    String? password,
    bool? rememberMe,
    bool? isSubmitting,
    String? error,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      userType: userType ?? this.userType,
      studentId: studentId ?? this.studentId,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
