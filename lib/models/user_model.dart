//create a user json model

class UserModel {
  late int? id=0;
  String email;
  String name;
  String password;
  String type;

  
  UserModel(

      {this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.type});

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      password: json["password"],
      type: json["type"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "password": password,
        "type": type,
      };
  @override
  String toString() {
    return "\n[ UserModel : id - $id, email- $email, name - $name, password - $password, type - $type ]";
  }
}
