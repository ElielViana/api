import 'package:api/model/user_model.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store{

  @observable
  List<UserModel> users = <UserModel>[].asObservable();

  @action
  void getAllUsers(List<UserModel> listUsers){
      users = listUsers.asObservable();
  }

}