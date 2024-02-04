import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_escola_facil/helpers/app_errors.dart';

import '../models/user_model.dart';

class UserRepository {
  UserRepository() {
    _loadCurrentUser();
  }

  late final UserModel userModel;
  UserModel? currentUser;
  late List<UserModel> listUsers;

  void _loadCurrentUser() {
    debugPrint("Usuario logado - $currentUser");
  }

  Future<void> initUsers() async {
    listUsers = [
      UserModel(
          email: 'sara@gmail.com',
          name: 'Sara Tuma',
          password: '1234',
          type: 'cliente',
          id: 1),
      UserModel(
          email: 'paciencia@gmail.com',
          name: 'Paciencia Manuel',
          password: '1234',
          type: 'admin',
          id: 2),
      UserModel(
          email: 'cesar@gmail.com',
          name: 'Cesar Kinanga',
          password: '1234',
          type: 'cliente',
          id: 3),
    ];
    debugPrint(listUsers.toString());
  }

  bool verifEmailPassword(String email, String password) {
    for (var element in listUsers) {
      if (element.email == email && element.password == password) {
        userModel = UserModel(
            email: element.email,
            name: element.name,
            password: element.password,
            type: element.type,
            id: element.id);
        currentUser = userModel;
        return true;
      }
    }
    return false;
  }

  Future<UserModel?> fazerLogin(
      {required String password,
      required String email,
      required Function onFail,
      required Function onSucess}) async {
    try {
      if (verifEmailPassword(email, password)) {
        _loadCurrentUser();
        onSucess();
        return Future.delayed(
          const Duration(seconds: 4),
          () => userModel,
        );
      } else {
        return Future.delayed(
          const Duration(seconds: 4),
          () => null,
        );
      }
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
      return null;
    }
  }

  Future<void> createNewUser(
      {required UserModel user,
      required Function onFail,
      required Function onSucess}) async {
    try {
      if (!verifEmailPassword(user.email, user.password)) {
        user.id = 4;
        onSucess();
        Future.delayed(
          const Duration(seconds: 4),
          () => listUsers.add(user),
        );
      } else {
        Future.delayed(const Duration(seconds: 4));
      }
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
      return null;
    }
  }
}
