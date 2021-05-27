import 'package:mobx/mobx.dart';
import 'package:poc_ws_app/src/modules/auth/models/user_model.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  
  @observable
  UserModel user;

  @action
  void setUser(UserModel userModel) {
    this.user = userModel;
  }
}

