class Constants {
  static bool darkMode = false;

  //urls
  // static String mainServerURL="https://rmrmobile.com/api/api.php";
  static String mainServerURL =
      "https://192.168.29.137/selfprojects/livfriend/api/api.php";

  static String appName = 'LivFriend';
  static String language = 'Rosario';
  static String language1 = 'playfair';
  static String appKey = 'livfriendkey';
  static String retryButton = 'Check & Hit Retry';
  static String convertInWebApp = 'Convert in Web App';
  static String shareTheApp = 'Share The App';
  static String pleaseDoNotTrust =
      "Please do not trust fraudulent information such as money transfer, lottery etc from strangers. Please do not share any personal information such as passwords, mobile numbers, otp etc. Please do not engage in nudity, pornography or any obscene acts";
  static String noInternetConnection =
      'Your Internet Connection\nmay not be active';

  static String lightLogo = "assets/images/logo.png";
  static String otpLogo = "assets/images/otp_confirm.json";
  static String hiLottie = "assets/images/hi.json";

  static String prefWebsite = "prefWebsite";
  static String directLink = "directLink";

  static String generatingKeyStore =
      "keytool -genkey -v -keystore upload-keystore.jks -alias dailystock -keyalg RSA -sigalg SHA1withRSA -keysize 2048 -validity 10000 -storetype JKS";
  static String iconCommand = 'flutter pub run flutter_launcher_icons';
  static String sha1Command =
      ' keytool -list -v -keystore webappdemo.jks -alias webappdemo -storepass webappdemo -keypass webappdemo';

  // paths routes
  static String splashPath = "/";
  static String loginPath = "/login";
  static String dashboardPath = "/dashboardPath";

  // keys
  static String isLogin = "isLogin";
  static String userID = "userID";
  static String userMobile = "userMobile";
  static String userGender = "userGender";
  static String userDOB = "userDOB";
  static String userMainImage = "userMainImage";
  static String userDND = "userDND";
  static String offlineStatus = "Offline";
  static String onlineStatus = "Online";
  static String busyStatus = "Busy";
}
