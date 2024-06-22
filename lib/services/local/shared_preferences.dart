import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // khởi tạo shared
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String keyAvatar = 'avatar';
// lấy path 
  Future<String?> getAvatarPath() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(keyAvatar);
  }
//lưu ảnh
  Future<void> saveAvatarPath(String avatar) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(keyAvatar, avatar);
  }
}
