// ignore_for_file: constant_identifier_names

part of Values;

class StringConst {
  // static const String baseUrl = "https://16.170.36.173/v1/user/";
  static const String baseUrl = "https://admin.care4consulting.co.uk/v1/user/";

  //version
  static const String getVersion = "auth/getVersion";

  //Firebase
  static const String apiKey = "AIzaSyD4UCPndxWnsZ-0chWLwqyyljJ85VoXsXs";
  static const String projectId = "c4care-988ac";
  static const String appId = "1:438222289672:android:b3332257b6235fa7098abd";
  static const String messageSenderId = "438222289672";

  //auth
  static const String login = "auth/login";
  static const String forgetPassword = "auth/forgetPassword";
  static const String updatePassword = "auth/updatePassword";

  //attendance
  static const String getAttendanceStatus = "attendance/getAttendanceStatus";
  static const String checkIn = "attendance/checkIn";
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
