abstract class LoginEvent {}

class UserTypeChanged extends LoginEvent {
  final String userType;
  UserTypeChanged(this.userType);
}

class LoginCredentialsChanged extends LoginEvent {
  final String studentId;
  final String password;
  LoginCredentialsChanged(this.studentId, this.password);
}

class RememberMeToggled extends LoginEvent {}

class SubmitLogin extends LoginEvent {}

class LoginPasswordVisibilityToggled extends LoginEvent {}
