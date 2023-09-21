import 'dart:ui';

class AppConfigs {
  AppConfigs._();

  static const String appName = "Newwave Solution JSC";

  ///Paging
  static const pageSize = 40;
  static const pageSizeMax = 1000;

  ///Local
  static const appLocal = 'vi_VN';
  static const appLanguage = 'vi';
  static const defaultLocal = Locale.fromSubtags(languageCode: appLanguage);

  ///DateFormat

  static const dateDisplayFormat = 'dd/MM/yyyy';
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';

  static const dateTimeAPIFormat =
      "YYYY-MM-DDThh:mm:ssTZD"; //Use DateTime.parse(date) instead of ...
  static const dateAPIFormat = 'dd/MM/yyyy';

  ///Date range
  static final identityMinDate = DateTime(1900, 1, 1);
  static final identityMaxDate = DateTime.now();
  static final birthMinDate = DateTime(1900, 1, 1);
  static final birthMaxDate = DateTime.now();

  ///Font
  static const fontFamily = 'BeVietnamPro';

  ///Max file
  static const maxAttachFile = 5;

  static const scrollThreshold = 500.0;
}

class FirebaseConfig {
  //Todo
}

class DatabaseConfig {
  //Todo
  static const int version = 1;
}

class MovieAPIConfig {
  static const headers = {'Content-Type': 'application/json'};
  static const String apiKey = '1dc7f1772bbd8ad37f9349ed78616e1a';
  static const String imageLink = 'http://image.tmdb.org/t/p/w500/';
  static const String host = "https://api.themoviedb.org/3/movie";
}

class UpGraderAPIConfig {
  static const String apiKey = '';
}
