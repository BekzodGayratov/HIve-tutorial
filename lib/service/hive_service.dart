import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:youtube/models/user_model.dart';

class MyDB {
  static late Box<UserModel> myBox;

  static Future<bool> getUserData() async {
    try {
      Response res =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      List<UserModel> data =
          (res.data as List).map((e) => UserModel.fromJson(e)).toList();
      await writeToBox(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  static openBox() async {
    myBox = await Hive.openBox("myBox");
  }

  static writeToBox(List<UserModel> data) async {
    myBox.clear();
    for (UserModel item in data) {
      myBox.add(item);
    }
  }

  static registerAdapter() {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
  }
}
