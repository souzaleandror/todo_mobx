import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) {
      print(email);
      print(password);
      print(isFormValid);
      print(isEmail);
      print(isPassword);
      print(isFormValidated);
    });
  }

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @observable
  bool passwordVisible = true;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  Future<void> login() async {
    loading = true;
    // Processes

    await Future.delayed(Duration(seconds: 2));
    loading = false;
    loggedIn = true;
    email = "";
    password = "";
  }

  @action
  void togglePassowrdVisibility() => passwordVisible = !passwordVisible;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isFormValid => email.length > 6 && password.length > 6;

  @computed
  bool get isEmail => email.length > 6;

  @computed
  bool get isPassword => password.length > 6;

  @computed
  bool get isFormValidated => isEmail && isPassword;

  @computed
  Function get loginPressed =>
      (isEmail && isPassword && !loading) ? login : null;

  @action
  void logout() {
    loggedIn = false;
  }
}
