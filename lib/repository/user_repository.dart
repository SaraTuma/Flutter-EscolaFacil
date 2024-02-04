import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_escola_facil/helpers/app_errors.dart';

import '../models/user_model.dart';

class UserRepository {
  UserRepository() {
    initUsers();
    _loadCurrentUser();
  }

  late UserModel userModel;
  UserModel? currentUser;
  late List<UserModel> listUsers;

  void _loadCurrentUser() {
    if (currentUser != null) {
      currentUser = findUserById(currentUser!.id);
    }
    debugPrint("Usuario logado - $currentUser");
  }

  UserModel? findUserById(int? id) {
    for (var element in listUsers) {
      if (element.id == id) {
        return element;
      }
    }
    return null;
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
        //pegar o usuario na base de dados

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

  void logOut() {
    //Dizer que já não existe um usuario logado
    currentUser = null;
  }
}
