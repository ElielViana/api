import 'package:api/repositories/user/user_repository.dart';
import 'package:api/stores/user_store.dart';

class UserController{
  
  UserController({required this.repository,required this.store});

  late UserRepository repository;
  late UserStore store;

  
  getAllUser()async{
    var users = await repository.getAllUser();
    store.getAllUsers(users);
  }
}