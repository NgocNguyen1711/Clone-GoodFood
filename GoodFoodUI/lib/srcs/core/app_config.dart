import '../common/environment.dart';

class AppConfig {
  AppConfig.internal();
  static final AppConfig instance = AppConfig.internal();
  Env env = Env.user();
  factory AppConfig({required Env env}) {
    instance.env = env;
    return instance;
  }
}
