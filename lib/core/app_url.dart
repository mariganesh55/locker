class AppUrl {
  static const String baseUrl = 'http://54.174.243.48:3001';

  // static const String baseUrl = 'http://api.smartdigilocker.com';

  static const String allLocker = '$baseUrl/locker/lockerdata';
  static const String register = '$baseUrl/user/register';
  static const String login = '$baseUrl/user/login';
  static const String unlock = '$baseUrl/locker/unlock';
  static const String userDetails = '$baseUrl/user/view';
  static const String createPasscode = '$baseUrl/user/createPasscode';

  static const String lockerHistory = '$baseUrl/locker/logdata';
  static const String releaseLocker = '$baseUrl/locker/updateuser';
  static const String emailRegister = '$baseUrl/user/emailregister';
  static const String emailLogin = '$baseUrl/user/emaillogin';
}
