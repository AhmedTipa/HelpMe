import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

Future<SharedPreferences> cacheHelperInit() async {
  return sharedPreferences = await SharedPreferences.getInstance();
}

Future saveData({
  required String key,
  required dynamic value,
}) async {
  if (value is String) {
    return await sharedPreferences!.setString(key, value);
  }
  if (value is bool) {
    return await sharedPreferences!.setBool(key, value);
  }
}

getData({
  required String key,
}) {
  return sharedPreferences!.get(key);
}

 Future<bool> removeData({required String key})async
{
return await sharedPreferences!.remove(key);
}
