import 'package:api/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository{
  Dio dio = Dio();

  Future<List<UserModel>>getAllUser()async{
    List<UserModel> users = <UserModel>[];
    Response response;
    
    response = await dio.get("https://reqres.in/api/users");
    List<dynamic> userList = response.data["data"];
    
    userList.forEach((element) {
      UserModel user = UserModel.fromJson(element);
      users.add(user);
    });
    
    return users;
  }
}