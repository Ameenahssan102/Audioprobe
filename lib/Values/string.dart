// ignore_for_file: constant_identifier_names

part of Values;

class StringConst {
  // static const String baseUrl = "https://16.170.36.173/v1/user/";
  static const String baseUrl =
      "https://audioprobe-8564ebe8f3b8.herokuapp.com/api";

  //version
  static const String getVersion = "/getVersion";

  //auth
  static const String login = "/auth/sign_in";
  static const String forgetPassword = "auth/forgetPassword";
  static const String updatePassword = "auth/updatePassword";

  //clients
  static const String LIST_OF_CLIENTS = "/clients/list_of_clients";
  static const String ADD_CLIENT = "/clients/add_client";
  static const String checkOut = "attendance/checkOut";
  static const String getMonthlyAttendance = "attendance/getMonthlyAttendance";
  static const String getWeeklyAttendance = "attendance/getWeeklyAttendance";

  //notification
  static const String getNotifications = "notification/getNotifications";

  //profile
  static const String getProfile = "profile/getProfile";
  static const String getProfileDetails = "profile/getProfileDetails";
  static const String updateProfileDetails = "profile/updateProfileDetails";
  static const String updateProfileImage = "profile/updateProfileImage";
  static const String updateDocumentImage = "profile/updateDocumentImage";
}
